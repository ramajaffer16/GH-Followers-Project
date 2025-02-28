//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by RAMA on 27/02/2025.
//
// I have to study this more

import UIKit

extension UIViewController {
    func presentGFAlertonMainThread(title: String?,message:String?,buttonTitle:String?){
        DispatchQueue.main.async {
            let alert = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
        }
        
    }
}
