//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by RAMA on 27/02/2025.
//



    

    import UIKit

    class GFBodyLabel: UILabel {

        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(textAlignment: NSTextAlignment){
            super.init(frame: .zero)
            self.textAlignment = textAlignment
            
        }
        
        func configure() {
            textColor = .label
            font = UIFont.preferredFont(forTextStyle: .body)
            adjustsFontSizeToFitWidth = true
            minimumScaleFactor = 0.9
            lineBreakMode = .byTruncatingTail
            translatesAutoresizingMaskIntoConstraints = false
        }
    }

  
