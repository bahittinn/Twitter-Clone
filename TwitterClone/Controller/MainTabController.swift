//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Bahittin on 15.08.2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    //MARK: - Helpers
    
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = templateNavigationContoller(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExplorerController()
        let nav2 = templateNavigationContoller(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notification = NotificationsController()
        let nav3 = templateNavigationContoller(image: UIImage(named: "search_unselected"), rootViewController: notification)
        
        let conversation = ConvarsationsController()
        let nav4 = templateNavigationContoller(image: UIImage(named: "search_unselected"), rootViewController: conversation)
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templateNavigationContoller(image: UIImage?,rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
}
