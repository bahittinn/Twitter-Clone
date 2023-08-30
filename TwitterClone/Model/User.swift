//
//  User.swift
//  TwitterClone
//
//  Created by Bahittin on 20.08.2023.
//

import Foundation
import Firebase

struct User {
    let fullname : String
    let email: String
    let username: String
    let profileImageUrl: String
    let uid: String
    
    var isCurrenUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}

