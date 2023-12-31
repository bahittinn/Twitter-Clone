//
//  NotificationsController.swift
//  TwitterClone
//
//  Created by Bahittin on 16.08.2023.
//

import UIKit

class NotificationsController: UIViewController {

    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
