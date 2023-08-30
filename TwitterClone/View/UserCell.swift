//
//  UserCell.swift
//  TwitterClone
//
//  Created by Bahittin on 30.08.2023.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
