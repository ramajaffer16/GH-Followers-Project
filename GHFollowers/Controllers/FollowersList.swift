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
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let followers):
                    print (followers)
                case .failure(let error):
                    self.presentGFAlertonMainThread(title: "Invalid Url input", message: error.localizedDescription, buttonTitle: "OK")
                }
            }
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
