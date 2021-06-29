//
//  BaseViewController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 28/06/21.
//

import UIKit

protocol BaseViewControllerDelegate {
    func showLoader()
    func hideLocader()
    func showMessage(_ message: String)
}

class BaseViewController: UIViewController, BaseViewControllerDelegate {
    
    // MARK: - Properties
    private var activityIndicator = UIActivityIndicatorView()
    private var greyView = UIView()
    
    // MARK: - Methods
    @objc func showLoader() {
        guard let window = SceneDelegate.windowView else { return }
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = window.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        
        let transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        activityIndicator.transform = transform
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        greyView.frame = CGRect(x: 0, y: 0, width: window.bounds.width, height: window.bounds.height)
        greyView.backgroundColor = .black
        greyView.alpha = 0.6
        view.addSubview(greyView)
    }
    
    @objc func hideLocader() {
        activityIndicator.stopAnimating()
        greyView.removeFromSuperview()
    }
    
    func showMessage(_ message: String) {
    }
}
