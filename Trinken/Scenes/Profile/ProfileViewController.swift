//
//  ProfileViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 15/06/21.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    private let nameLabel = TitleLabel(textAlignment: .left, fontSize: 24)
    
    private let optionsTableView = UITableView()
    private var menuOptions: [MenuOptions]?
    private let profileView = UIView()
    
    private let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit profile", for: .normal)
        button.tintColor = Colors.PRIMARY_COLOR
        button.addTarget(self, action: #selector(addProfileImageButtonTapped), for: .touchUpInside)
        return button
    } ()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView(image: SFSymbols.USER_CIRCLE_FILL)
        imageView.tintColor = .black
        return imageView
    } ()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setMenuOptions()
        configureImagePicker()
        configureTableView()
        layoutProfileView()
        layoutUI()
    }
    
    // MARK: - Actions
    @objc private func addProfileImageButtonTapped() {
        present(imagePicker, animated: true)
    }
    
    // MARK: - Methods
    private func setMenuOptions() {
        menuOptions = [.termsAndConditions, .feedback, .about]
    }
    
    private func configureImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    private func configureTableView() {
        optionsTableView.rowHeight = 75
        optionsTableView.removeExcessCells()
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.register(MenuOptionCell.self, forCellReuseIdentifier: MenuOptionCell.reuseID)
    }
    
    private func configureProfileImageView() {
        profileImageView.layer.cornerRadius = 30
        profileImageView.layer.masksToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 3
    }
    
    private func layoutProfileView() {
        nameLabel.text = "User"
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, editProfileButton])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        
        profileView.addSubviews(profileImageView, stackView)
        
        for view in [profileImageView, editProfileButton, stackView] {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            
            stackView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20)
        ])
    }
    
    private func layoutUI() {
        view.addSubviews(profileView, optionsTableView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        optionsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 100),
            
            optionsTableView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10),
            optionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        
        self.profileImage = profileImage
        self.profileImageView.image = profileImage
        
        configureProfileImageView()
        
        dismiss(animated: true, completion: nil)
        
        guard let imageData = self.profileImage?.jpegData(compressionQuality: 0.3) else { return }
        let imageFileName = NSUUID().uuidString
        let storageRef = DB.STORAGE_PROFILE_IMAGES_REF.child(imageFileName)

        storageRef.putData(imageData, metadata: nil) { storageMetadata, error in
            storageRef.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                DB.USERS_REF.child(uid).observeSingleEvent(of: .value) { dataSnapshot in
                    guard let userDictionary = dataSnapshot.value as? [String : AnyObject] else { return }
                    
                    var user = User(uid: uid, dictionary: userDictionary)
                    user.profileImageUrl = profileImageUrl
                    
                    let values = ["fullname" : user.fullname,
                                  "email" : user.email,
                                  "profileImageUrl" : user.profileImageUrl]
                    
                    DB.USERS_REF.child(uid).updateChildValues(values)
                }
            }
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuOptionCell.reuseID) as! MenuOptionCell
        cell.set(menuOption: menuOptions?[indexPath.row])
        return cell
    }
}
