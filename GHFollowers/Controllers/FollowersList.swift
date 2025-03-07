//
//  FollowersList.swift
//  GHFollowers
//
//  Created by RAMA on 26/02/2025.
//

import UIKit

class FollowersList: UIViewController{
    var username: String!
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         getFollowers()
         viewcontroller()
        configureCollectionView()
       }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func  configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
            view.addSubview(collectionView)
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID )
        collectionView.backgroundColor = .systemPink
        
    }
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let padding:CGFloat = 12
        let width = view.bounds.width
        let itemSpacing:CGFloat = 10
        let availableWidth = width - (padding * 2) - (itemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
        
        
    }
    
    func getFollowers(){
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
    
    func viewcontroller(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
}
