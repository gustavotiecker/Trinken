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
    
    let emailTextField = BasicTextField(placeholder: "Email address", icon: SFSymbols.MAIL)
    let passwordTextField = BasicTextField(placeholder: "Password", icon: SFSymbols.LOCK)
    
    let loginButton = PrimaryButton(title: "Login", backgroundColor: Colors.PRIMARY_COLOR)
    let goToSignUpButton = AttributedButton("Don't have an account? ", "Sign Up")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.BACKGROUND_COLOR
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkIsNewUser()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureScrollView()
        configureUIElements()
        layoutUI()
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.signUserIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func goToSignUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(SignUpViewController(), animated: true)
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
        configureButtons()
    }
    
    private func configureLabels() {
        welcomeLabel.text = "Welcome back!"
        instructionsLabel.text = "Enter with your account"
    }
    
    private func configureTextFields() {
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
    }
    
    private func configureButtons() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        goToSignUpButton.addTarget(self, action: #selector(goToSignUpButtonTapped), for: .touchUpInside)
    }
    
    private func layoutUI() {
        contentView.addSubviews(welcomeLabel, instructionsLabel, emailTextField, passwordTextField, loginButton, goToSignUpButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 88),
            welcomeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            instructionsLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            instructionsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 36),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 18),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 36),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            
            goToSignUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 18),
            goToSignUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

