//
//  WelcomeViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 01/06/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var imageView = UIImageView()
    var onboardingTitle = TitleLabel(textAlignment: .center, fontSize: 22)
    var onboardingDescription = BodyLabel(textAlignment: .center)
    var actionButton = PrimaryButton(title: "Get started", backgroundColor: UIColor(named: "primary-color")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")
        layoutUI()
        setButtonAction()
    }
    
    @objc private func buttonTapped() {
        print("Button tapped")
    }
    
    private func setButtonAction() {
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func layoutUI() {
        view.addSubview(imageView)
        view.addSubview(onboardingTitle)
        view.addSubview(onboardingDescription)
        view.addSubview(actionButton)
        
        imageView.image = UIImage(named: "welcome-banner")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        onboardingTitle.text = "Time for a drink!"
        onboardingDescription.text = "Learn how the best \ndrinks are made"
        
        let imageSize = UIScreen.main.bounds.height * 0.6
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),
            
            onboardingTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 56),
            onboardingTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            onboardingDescription.topAnchor.constraint(equalTo: onboardingTitle.bottomAnchor, constant: 18),
            onboardingDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            actionButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
