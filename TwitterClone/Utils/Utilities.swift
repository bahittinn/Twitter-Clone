//
//  Utilities.swift
//  TwitterClone
//
//  Created by Bahittin on 16.08.2023.
//

import UIKit

class Utilities {
    func inputContainerView(withImage image: UIImage?, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        iv.image = image
        view.addSubview(iv)
        
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let divierView = UIView()
        view.addSubview(divierView)
        divierView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        divierView.backgroundColor = .white
        return view
    }
    
    func textField(withPlaceHolder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
}
