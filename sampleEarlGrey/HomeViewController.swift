//
//  HomeViewController.swift
//  sampleEarlGrey
//
//  Created by Rakesh on 05/04/18.
//  Copyright © 2018 Rakesh. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLogOutButton()
        
        if Auth.auth().currentUser == nil{
            // present if current user is not logged in.
            DispatchQueue.main.async {
                let loginController = LoginViewController()
                let navigationLoginController = UINavigationController(rootViewController: loginController)
                self.present(navigationLoginController, animated: false, completion: nil)
            }
            return
        }
   
    }
    
    fileprivate func setupLogOutButton(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleLogOut))
        navigationItem.rightBarButtonItem?.isAccessibilityElement = true
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = "settings"
    }
    
    @objc func handleLogOut(){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout", style: UIAlertActionStyle.destructive, handler: { (_) in
            
            do{
                try Auth.auth().signOut()
                
                // what happens? we need to present some kind of login controller
                let loginController = LoginViewController()
                let navController = UINavigationController(rootViewController: loginController)
                
                self.present(navController, animated: true, completion: nil)
                
            }catch let signOutError {
                print("signOut Error:",signOutError)
            }
            
        })
       
        let cancelLogoutAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(logoutAction)
        alertController.addAction(cancelLogoutAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
