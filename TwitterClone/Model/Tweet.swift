//
//  Tweet.swift
//  TwitterClone
//
//  Created by Bahittin on 22.08.2023.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetID: String
    let likes: Int
    var timestamp: Date!
    let uid: String
    let retweetCount: Int
    
    init(tweetID: String, dictionary: [String: Any]) {
        self.tweetID = tweetID
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0
        self.uid = dictionary["caption"] as? String ?? ""
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
