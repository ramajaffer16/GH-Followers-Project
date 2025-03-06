//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by RAMA on 06/03/2025.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholder = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(){
        image = placeholder
        layer.cornerRadius = 10
        clipsToBounds = true
        
        
    }
    
   

}
