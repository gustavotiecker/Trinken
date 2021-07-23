//
//  SearchViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 03/06/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    let searchBar = UISearchBar()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        configureNavigation()
        configureSearchBar()
        createDismissKeyboardTapGesture()
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func configureNavigation() {
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.tintColor = Colors.PRIMARY_TINT_COLOR
    }
    
    private func configureSearchBar() {
        searchBar.showsCancelButton = false
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
    }
    
    private func search(shouldShow: Bool) {
        
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}
