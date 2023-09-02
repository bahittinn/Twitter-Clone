//
//  UserService.swift
//  TwitterClone
//
//  Created by Bahittin on 20.08.2023.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictonary = snapshot.value as? [String: AnyObject] else { return }
            guard let username = dictonary["username"] as? String else { return }
            
            let user = User(uid: uid, dictionary: dictonary)
            completion(user)
        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        REF_USERS.observe(.childAdded) { snapshot in
            let uid = snapshot.key
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            users.append(user)
            completion(users)
        }
    }
    
    func followUser(uid: String, completion: @escaping(Database, Error?) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        print("DEBUG: current user is \(currentUid) stared following \(uid)")
        print("DEBUG: Uid \(uid) gained \(currentUid) as a follower ")
        
        //REF_USER_FOLLOWİNG.child(currentUid).updateChildValues([uid: 1])
    }
}
