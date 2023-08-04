//
//  PhishingViewController.swift
//  Final Product
//
//  Created by Anushka Khatri on 4/6/23.
//

import UIKit

class PhishingViewController: UIViewController {

    @IBOutlet var greeting: UILabel!
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        greeting.text = "Hi \(username)"
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
