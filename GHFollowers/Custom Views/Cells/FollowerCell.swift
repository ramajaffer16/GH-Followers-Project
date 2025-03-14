//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by RAMA on 07/03/2025.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    var username = GFTitleLabel(textAlignment: .center, fontSize: 16)
    var avatarImage = GFAvatarImageView(frame: .zero)
    let padding:CGFloat = 8
    static let reuseID = "FollowerCell"
    
    override init(frame: CGRect ) {
        super.init(frame: frame)
        config()
    }
    
    
    func config(){
        addSubview(username)
        addSubview(avatarImage)
        
        username.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor)])
        
        NSLayoutConstraint.activate([username.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),username.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),username.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),username.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: FollowersResponse) {
            username.text = follower.login
//            avatarImage.downloadImage(from: follower.avatarUrl) // Assuming `downloadImage(from:)` exists
        }
        
    
}
