//
//  SearchVC.swift
//  GHFollowers
//
//  Created by RAMA on 21/02/2025.
//

import UIKit

class SearchVC: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
    let logoImage = UIImageView()
    let textField = GFTextField()
    let searchButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    var isUsernameEntered: Bool {
        !textField.text!.isEmpty
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurelogoImage()
        configuretextField()
        configuresearchButton()
        view.backgroundColor = .systemBackground
        
    
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
//    Dismiss keyboard after entering username
    func dismissKeyBoard(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func configurelogoImage(){
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "gh-logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),logoImage.heightAnchor.constraint(equalToConstant: 200),logoImage.widthAnchor.constraint(equalToConstant: 200)])
        
        
    }

    func configuretextField(){
        view.addSubview(textField)
        //   set the delegate what to listen
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 48),textField.heightAnchor.constraint(equalToConstant: 50),textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:50),textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)])
    }
    
    func configuresearchButton(){
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
       
        NSLayoutConstraint.activate([searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),searchButton.heightAnchor.constraint(equalToConstant: 50)])
    }
// command action for the button and parsing the data
    @objc func pushViewController(){
        guard isUsernameEntered else {
            presentGFAlertonMainThread(title: "Empty Username", message: "Please enter username. We need to know who to look for 😂", buttonTitle: "ok")
            return
        }
        let followerslist = FollowersList()
        followerslist.title = textField.text
        followerslist .username = textField.text
        navigationController?.pushViewController(followerslist, animated: true)
        
    }

    
//    setting the delegate
    

}
//extension SearchVC: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        pushViewController()
//        return true
//    }
//}







//Validators
//var isValidEmail:Bool {
//    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
//    return emailPredicate.evaluate(with: self)
//}
//
//var isVCalidPassword: Bool{
//    let passwordFormat = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
//    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
//    return emailPredicate.evaluate(with: self)
//}
