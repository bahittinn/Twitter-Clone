//
//  TweetViewModel.swift
//  TwitterClone
//
//  Created by Bahittin on 24.08.2023.
//

import UIKit

struct TweetViewModel {
    let tweet: Tweet
    let user: User
    
    var profileImageUrl : URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var timeStamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "2m"
    }
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname,
                                              attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        title.append(NSAttributedString(string: " @\(user.username)",
                                        attributes: [
                                            .font: UIFont.systemFont(ofSize: 14),
                                            .foregroundColor: UIColor.lightGray]))
        title.append(NSAttributedString(string: " ・ \(timeStamp)",
                                        attributes: [
                                            .font: UIFont.systemFont(ofSize: 14),
                                            .foregroundColor: UIColor.lightGray]))
        return title
    }
    
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user  = tweet.user
    }
}
