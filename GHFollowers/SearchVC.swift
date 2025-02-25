//
//  SearchVC.swift
//  GHFollowers
//
//  Created by RAMA on 21/02/2025.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImage = UIImageView()
    let textField = GFTextField()
    let searchButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        configurelogoImage()
        configuretextField()
        configuresearchButton()
        view.backgroundColor = .systemBackground
    
    }
    

    func configurelogoImage(){
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "gh-logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),logoImage.heightAnchor.constraint(equalToConstant: 200),logoImage.widthAnchor.constraint(equalToConstant: 200)])
        
        
    }
    
    func configuretextField(){
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 48),textField.heightAnchor.constraint(equalToConstant: 50),textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:50),textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)])
    }
    
    func configuresearchButton(){
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),searchButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    

}
