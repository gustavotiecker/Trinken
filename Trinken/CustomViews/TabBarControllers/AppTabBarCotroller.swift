//
//  AppTabBarCotroller.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 03/06/21.
//

import UIKit

class AppTabBarCotroller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor(named: "background-color")
        viewControllers = [createHomeNavigationController(), createSearchNavigationController()]
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let homeViewController = HomeViewController()
        homeViewController.title = "Home"
        homeViewController.tabBarItem = UITabBarItem(title: "", image: SFSymbols.HOME, tag: 0)
        
        return UINavigationController(rootViewController: homeViewController)
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(title: "", image: SFSymbols.SEARCH, tag: 0)
        
        return UINavigationController(rootViewController: searchViewController)
    }
}
