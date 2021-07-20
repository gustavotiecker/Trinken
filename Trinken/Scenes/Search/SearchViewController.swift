//
//  SearchViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 03/06/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    let searchTextField = BasicTextField(placeholder: "Search for a drink", icon: SFSymbols.SEARCH)
    let searchButton = PrimaryButton(title: "Get Drinks", backgroundColor: Colors.SECONDARY_COLOR)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(searchTextField, searchButton)
        navigationController?.isNavigationBarHidden = true
        configureSearchTextField()
        configureSearchButton()
        createDismissKeyboardTapGesture()
    }
    
    // MARK: - Actions
    @objc private func searchButtonPressed() {
        
    }
    
    // MARK: - Private Methods
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func configureSearchTextField() {
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureSearchButton() {
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchViewController: UITextFieldDelegate {
    
}
