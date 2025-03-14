//
//  FollowersList.swift
//  GHFollowers
//
//  Created by RAMA on 26/02/2025.
//

 import UIKit

class FollowersList: UIViewController {
    var followers: [FollowersResponse] = []
//    enum Section{
//        case main
//    }
    
    var username: String!
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
         getFollowers()
         viewcontroller()
       }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func viewcontroller(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    func  configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout())
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
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
//    the follower passed in the followerCell
    func configureDataSource(){
//        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, followers in
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
//            cell.set(followers:followers)
//            return cell
//        })
    }
    
    func updateData(){
        
    }
    
    func getFollowers(){
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let followers):
                    print (followers)
                    self.followers = followers
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
//                    self.collectionView.reloadData()
                case .failure(let error):
                    self.presentGFAlertonMainThread(title: "Invalid Url input", message: error.localizedDescription, buttonTitle: "OK")
                }
            }
        }
    }
    
    
    
}

extension FollowersList: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
      
       
     
       cell.username.text = followers[indexPath.row].login
        return cell
    }
}
