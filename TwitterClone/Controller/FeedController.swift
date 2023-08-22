//
//  FeedController.swift
//  TwitterClone
//
//  Created by Bahittin on 16.08.2023.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "TweetCell"

class FeedController: UICollectionViewController {

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
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        as! TweetCell
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
