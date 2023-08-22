//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Bahittin on 15.08.2023.
//

import UIKit
import Firebase
class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    var user: User? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedController else { return }
            
            feed.user = user
        }
    }
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .twitterBlue
        //logUserOut()
        chechUserStatus()
    }
    //MARK: - API
    
    func fetchUser() {
        UserService.shared.fetchUser { user in
            self.user = user
        }
    }
    
    func chechUserStatus() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let vc = UINavigationController(rootViewController: LoginController())
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        } else {
            configureViewControllers()
            configureUI()
            fetchUser()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: error \(error.localizedDescription)  ")
        }
    }
    
    //MARK: - Selector
    @objc func actionButtonTapped() {
        guard let user = user else { return }
        let controller = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingBottom: 64,
                            paddingRight: 16,
                            width: 56,
                            height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationContoller(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExplorerController()
        let nav2 = templateNavigationContoller(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notification = NotificationsController()
        let nav3 = templateNavigationContoller(image: UIImage(named: "like_unselected"), rootViewController: notification)
        
        let conversation = ConvarsationsController()
        let nav4 = templateNavigationContoller(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversation)
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templateNavigationContoller(image: UIImage?,rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
}


