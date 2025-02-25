//
//  GFButton.swift
//  GHFollowers
//
//  Created by RAMA on 24/02/2025.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor : UIColor , title : String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    func configure(){
        titleLabel?.textColor = .white
        titleLabel?.font      = UIFont.preferredFont(forTextStyle: .headline)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
