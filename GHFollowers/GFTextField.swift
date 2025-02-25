//
//  GFTextField.swift
//  GHFollowers
//
//  Created by RAMA on 25/02/2025.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        layer.cornerRadius = 10
        layer.borderWidth  = 2
        layer.borderColor  = UIColor.systemGray4.cgColor
        
        
        textColor      = .label
        font           = UIFont.preferredFont(forTextStyle: .title2)
        tintColor      = .label
        textAlignment  = .center
        minimumFontSize = 12
        adjustsFontSizeToFitWidth = true
        placeholder = "Enter your username"
    }
    
} 
