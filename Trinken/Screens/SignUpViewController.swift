//
//  SignUpViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 04/06/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    let scrollView = UIScrollView()
    let contentView = UIView()
    var formStackView = UIStackView()
    
    let titleLabel = TitleLabel(textAlignment: .center, fontSize: 20)
    
    let fullNameTextField = BasicTextField(placeholder: "Full name", icon: SFSymbols.user)
    let emailTextField = BasicTextField(placeholder: "Email address", icon: SFSymbols.mail)
    let passwordTextField = BasicTextField(placeholder: "Password", icon: SFSymbols.password)
    let passwordConfirmationTextField = BasicTextField(placeholder: "Confirm password", icon: SFSymbols.password)
    
    let signUpButton = PrimaryButton(title: "Sign Up", backgroundColor: Colors.primaryColor)
    let goToSignInButton = AttributedButton("Already have an account? ", "Sign In")

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        configure()
        layoutUI()
    }
    
    // MARK: - Actions
    @objc private func signUpButtonTapped() {
        print("Sign up tapped")
    }
    
    @objc private func goToSignInButtonTapped() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Methods
    private func configure() {
        configureScrollView()
        configureStackView()
        configureLabels()
        configureButtons()
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 800)
        ])
    }
    
    private func configureStackView() {
        formStackView = UIStackView(arrangedSubviews: [fullNameTextField, emailTextField, passwordTextField, passwordConfirmationTextField])
        formStackView.axis = .vertical
        formStackView.spacing = 18
        formStackView.distribution = .fillEqually
        formStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLabels() {
        titleLabel.text = "Create your account"
    }
    
    private func configureButtons() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        goToSignInButton.addTarget(self, action: #selector(goToSignInButtonTapped), for: .touchUpInside)
    }
    
    private func layoutUI() {
        contentView.addSubviews(titleLabel, formStackView, signUpButton, goToSignInButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 36),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            formStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            formStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            formStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            formStackView.heightAnchor.constraint(equalToConstant: 278),
            
            signUpButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 36),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            signUpButton.heightAnchor.constraint(equalToConstant: 56),
            
            goToSignInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 18),
            goToSignInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
