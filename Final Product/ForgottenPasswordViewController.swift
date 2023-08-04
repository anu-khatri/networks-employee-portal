//
//  ForgottenPasswordViewController.swift
//  Final Product
//
//  Created by Anushka Khatri on 4/16/23.
//

import UIKit

class ForgottenPasswordViewController: UIViewController {
    
    @IBOutlet var securityNum: UITextField!
    @IBOutlet var correctPassword: UILabel!
    var userKey: [Int: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func securityKeyEntered(_ sender: Any) {
        guard let securityNumber = securityNum.text else { return}
        correctPassword.text = userKey[Int(securityNumber)!]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
