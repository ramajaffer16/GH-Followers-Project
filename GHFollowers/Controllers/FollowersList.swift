//
//  FollowersList.swift
//  GHFollowers
//
//  Created by RAMA on 26/02/2025.
//

import UIKit

class FollowersList: UIViewController{
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
