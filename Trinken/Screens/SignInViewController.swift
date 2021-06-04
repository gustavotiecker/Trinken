//
//  SignInViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 28/05/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    let scrollView = UIScrollView()
    let contentView = UIView()
    let welcomeLabel = TitleLabel(textAlignment: .center, fontSize: 20)
    let instructionsLabel = BodyLabel(textAlignment: .center)
    let emailTextField = BasicTextField(placeholder: "E-mail", icon: SFSymbols.mail!)
    let passwordTextField = BasicTextField(placeholder: "Password", icon: SFSymbols.password!)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        checkIsNewUser()
        configureScrollView()
        configureUIElements()
        layoutUI()
    }
    
    // MARK: - Methods
    private func checkIsNewUser() {
        if OnboardingControl.shared.isNewUser() {
            let welcomeViewController = WelcomeViewController()
            welcomeViewController.modalPresentationStyle = .fullScreen
            present(welcomeViewController, animated: true)
        }
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
    
    private func configureUIElements() {
        configureLabels()
        configureTextFields()
    }
    
    private func configureLabels() {
        welcomeLabel.text = "Welcome back!"
        instructionsLabel.text = "Enter with your account"
    }
    
    private func configureTextFields() {
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
    }
    
    private func layoutUI() {
        contentView.addSubviews(welcomeLabel, instructionsLabel, emailTextField, passwordTextField)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 36),
            welcomeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            instructionsLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            instructionsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 36),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 18),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

