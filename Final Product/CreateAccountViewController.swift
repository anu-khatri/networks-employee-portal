//
//  CreateAccountViewController.swift
//  Final Product
//
//  Created by Anushka Khatri on 2/28/23.
//

import UIKit

class CreateAccountViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var createAccount: UIButton!
    @IBOutlet var showOrHide: UIButton!
    @IBOutlet var strengthLabel: UILabel!
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var usernameEntered: UITextField!
    @IBOutlet var passwordEntered: UITextField!
    var pickerData : [String] = [String]()
    var selectedJob : String = ""
    var iconClick = true
    var securityNum = 0
    @IBOutlet var securityNumDisplayed: UILabel!
    var p : PasswordStrengthTester = PasswordStrengthTester()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createAccount.isEnabled = false
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["HR", "Sales", "Finance", "IT"]
        strengthLabel.text = ""
    }
    
    @IBAction func showOrHidePassword(_ sender: Any) {
        if iconClick {
            passwordEntered.isSecureTextEntry = false
            } else {
                passwordEntered.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedJob = pickerData[row]
    }
    

    @IBAction func passwordEdited(_ sender: Any) {
        guard let password = passwordEntered.text else {return}
        if (p.checkStrength(password: password) == 0) {
            strengthLabel.textColor = UIColor.red
            strengthLabel.text = "Weak"
        }
        
        else if (p.checkStrength(password: password) == 1) {
            strengthLabel.textColor = UIColor.systemYellow
            strengthLabel.text = "Medium"
        }
        
        else
        {
            strengthLabel.textColor = UIColor.systemGreen
            strengthLabel.text = "Strong"
            createAccount.isEnabled = true
        }
        securityNum = Int.random(in: 0...100)
        securityNumDisplayed.text = String(securityNum)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let loginVC = tabBarController?.viewControllers![0] as! ViewController
        guard let user = usernameEntered.text, let pass = passwordEntered.text else {return}
        loginVC.userAccounts[user] = pass
        loginVC.userJobs[user] = selectedJob
        loginVC.userKey[securityNum] = pass
        usernameEntered.text = ""
        passwordEntered.text = ""
        strengthLabel.text = ""
        securityNumDisplayed.text = ""
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

/*if let password = passwordEntered.text, password.isEmpty == false {
    self.strengthLabel.isHidden = false
    self.strengthLabel.alpha = 0
    let validationId = PasswordStrengthManager.checkValidationWithUniqueCharacter(pass: password, rules: PasswordRules.passwordRule, minLength: PasswordRules.minPasswordLength, maxLength: PasswordRules.maxPasswordLength, isUniqueCharRequired: false)
    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
        self?.strengthLabel.alpha = CGFloat(validationId.alpha)
        
        //                self?.instructionHeightConstrain.constant = CGFloat(validationId.constant)
        
        self?.strengthLabel.text = validationId.text})
    let progressInfo = PasswordStrengthManager.setProgressView(strength: validationId.strength)
    
    self.progressBar.setProgress(progressInfo.percentage, animated: true)
    self.progressBar.progressTintColor = UIColor.colorFrom(hexString: progressInfo.color)
}
else
{
    self.strengthLabel.isHidden = false
    self.strengthLabel.alpha = 0
    self.progressBar.setProgress(0, animated: true)
    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
        self?.strengthLabel.alpha = 1
        self?.strengthLabel.text = "Password cannot be empty"
    }) { (_) in
        UIView.animate(withDuration: 0.8, delay: 0, animations: { [weak self] in
            self?.strengthLabel.alpha = 1
            self?.strengthLabel.isHidden = true
        })
    }
}*/
