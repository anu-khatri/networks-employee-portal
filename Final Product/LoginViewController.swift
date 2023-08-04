//
//  ViewController.swift
//  Final Product
//
//  Created by Anushka Khatri on 2/24/23.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITabBarControllerDelegate {
    
    
    @IBOutlet var tryAgain: UILabel!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var passwordEntered: UITextField!
    var userAccounts : [String:String] = [:]
    @IBOutlet var showOrHide: UIButton!
    var userJobs : [String:String] = [:]
    var userKey: [Int: String] = [:]
    @IBOutlet var forgottenPassword: UILabel!
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func showOrHidePassword(_ sender: Any) {
        if iconClick {
            passwordEntered.isSecureTextEntry = false
        } else {
            passwordEntered.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let user = username.text, let pass = password.text else {return}
        let messageVC = tabBarController?.viewControllers![2] as! MessageViewController
        messageVC.x = user
        username.text = ""
        password.text = ""
        if(userAccounts[user] == pass)
        {
            tryAgain.text = ""
            var job = userJobs[user]
            if(job == "HR")
            {
                performSegue(withIdentifier: "HR", sender: nil)
            }
            if(job == "Sales")
            {
                performSegue(withIdentifier: "sales", sender: nil)
            }
            if(job == "Finance")
            {
                performSegue(withIdentifier: "finance", sender: nil)
            }
            if(job == "IT")
            {
                performSegue(withIdentifier: "IT", sender: nil)
            }
            if let tabItems = tabBarController?.tabBar.items {
                let tabItem = tabItems[2]
                tabItem.badgeValue = "1"
            }
        }
        else
        {
            tryAgain.text = "Wrong username or password. Try Again!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toPassword")
        {
            let displayVC = segue.destination as! ForgottenPasswordViewController
            displayVC.userKey = userKey
        }
    }
}

