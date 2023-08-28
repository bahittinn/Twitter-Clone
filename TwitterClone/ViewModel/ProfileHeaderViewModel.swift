//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by Bahittin on 26.08.2023.
//

import Foundation

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets:  return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes:   return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    private let user: User
    init(user: User) {
        self.user = user
    }
}
