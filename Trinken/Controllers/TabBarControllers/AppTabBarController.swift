//
//  AppTabBarController.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 03/06/21.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.BACKGROUND_COLOR
        UITabBar.appearance().tintColor = Colors.PRIMARY_TINT_COLOR
    }
    
    override func viewDidAppear(_ animated: Bool) {
        authenticateUser()
    }
    
    func authenticateUser() {
        if AuthService.shared.hasUserSignedIn {
            configureTabBar()
            
            guard let uid = UserService.shared.getCurrentUserUid() else { return }
            
            UserService.shared.fetchUser(uid: uid, completion: { user in
                UserManager.shared.currentUser = user
            })
        } else {
            DispatchQueue.main.async {
                let navigationController = UINavigationController(rootViewController: SignInViewController())
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.isNavigationBarHidden = true
                self.present(navigationController, animated: true, completion: nil)
            }
        }
    }
    
    private func configureTabBar() {
        viewControllers = [createHomeNavigationController(),
                           createSearchNavigationController(),
                           createFavoritesNavigationController(),
                           createProfileNavigationController()]
    }
    
    private func createHomeNavigationController() -> UINavigationController {
        let homeViewController = HomeViewController()
        homeViewController.title = "Home"
        homeViewController.tabBarItem = UITabBarItem(title: "", image: SFSymbols.HOME, tag: 0)
        
        return UINavigationController(rootViewController: homeViewController)
    }
    
    private func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(title: "", image: SFSymbols.SEARCH, tag: 1)
        
        return UINavigationController(rootViewController: searchViewController)
    }
    
    private func createFavoritesNavigationController() -> UINavigationController {
        let favoritesNavigationController = FavoritesViewController()
        favoritesNavigationController.title = "Favorites"
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "", image: SFSymbols.STAR, tag: 2)
        
        return UINavigationController(rootViewController: favoritesNavigationController)
    }
    
    private func createProfileNavigationController() -> UINavigationController {
        let profileNavigationController = ProfileViewController()
        profileNavigationController.title = "Profile"
        profileNavigationController.tabBarItem = UITabBarItem(title: "", image: SFSymbols.USER, tag: 3)
        
        return UINavigationController(rootViewController: profileNavigationController)
    }
}
