//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by RAMA on 27/02/2025.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView()
    let titlelabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let bodyLabel = GFBodyLabel(textAlignment: .center)
    let button = GFButton(backgroundColor: .systemPink, title: "OK")
    var padding:CGFloat = 20
    
    var alertTitle: String?
    var message: String?
    var buttonTitle : String?
    
    init(title: String?,message: String?, buttonTitle:String?){
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configcontainerView()
        configtitlelabel()
        configbutton()
        configBodyLabel()

    }
    
    func configcontainerView(){
        view.addSubview(containerView)
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = .systemBackground
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),containerView.heightAnchor.constraint(equalToConstant: 220),containerView.widthAnchor.constraint(equalToConstant: 280)]) 
        
     
    }
    
    func configtitlelabel() {
        containerView.addSubview(titlelabel)
        titlelabel.text = alertTitle ?? "something is wrong"
        
        NSLayoutConstraint.activate([titlelabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),titlelabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),titlelabel.heightAnchor.constraint(equalToConstant: 28),titlelabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding)])
        
    }
    
    func configbutton(){
        containerView.addSubview(button)
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(dismissbutton), for: .touchUpInside)
        NSLayoutConstraint.activate([button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),button.heightAnchor.constraint(equalToConstant: 44)])
    }
    @objc func dismissbutton() {
        dismiss(animated: true)
        
    }
    func configBodyLabel(){
        containerView.addSubview(bodyLabel)
        bodyLabel.text = message ?? "Unable to fetch request"
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.numberOfLines = 4
        bodyLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([bodyLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 8),bodyLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -12),bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)])
        
        
    }
    


}
