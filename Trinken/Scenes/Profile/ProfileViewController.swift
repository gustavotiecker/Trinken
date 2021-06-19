//
//  ProfileViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 15/06/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    private let nameLabel = TitleLabel(textAlignment: .left, fontSize: 24)
    
    private let optionsTableView = UITableView()
    private let options = ["Terms and coditions", "Feedback", "About"]
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
    private func configureImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    private func configureTableView() {
        optionsTableView.backgroundColor = Colors.BACKGROUND_COLOR
        optionsTableView.rowHeight = 50
        optionsTableView.tableFooterView = UIView(frame: .zero)
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func layoutProfileView() {
        nameLabel.text = "User"
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, editProfileButton, optionsTableView])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        
        profileView.addSubviews(profileImageView, stackView, optionsTableView)
        
        for view in [profileImageView, editProfileButton, stackView] {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            
            stackView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            
            optionsTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            optionsTableView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor),
            optionsTableView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor),
            optionsTableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func layoutUI() {
        view.addSubviews(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        
        self.profileImage = profileImage
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.backgroundColor = Colors.BACKGROUND_COLOR
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(options[indexPath.row])
    }
}
