//
//  UserinfoResponse.swift
//  GHFollowers
//
//  Created by RAMA on 28/02/2025.
//

import UIKit

struct UserinfoResponse: Decodable{
    let login:String
    let avatarUrl: String
    let followersUrl: Int
    let followingUrl: Int
    let publicRepos:Int
}
