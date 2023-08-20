//
//  UserService.swift
//  TwitterClone
//
//  Created by Bahittin on 20.08.2023.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictonary = snapshot.value as? [String: AnyObject] else { return }
            guard let username = dictonary["username"] as? String else { return }
            print("DEBUG: username is \(username)")
            
            let user = User(uid: uid, dictionary: dictonary)
            completion(user)
        }
    }
}
