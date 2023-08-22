//
//  FeedController.swift
//  TwitterClone
//
//  Created by Bahittin on 16.08.2023.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {

    //MARK: - Properties
    
    var user: User? {
        didSet {
            configureLeftBarButton()
            configureUI()
          }
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchTweets()
    }
    
    //MARK: - API
    
    func fetchTweets() {
        TweetService.shared.fetchTweets { tweets in
            print("DEBUG: tweets is \(tweets[0].caption)")
        }
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        guard let user = user else { return }
        
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
    }
    func configureLeftBarButton() {
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        guard let url = URL(string: user!.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView )
    }
}
