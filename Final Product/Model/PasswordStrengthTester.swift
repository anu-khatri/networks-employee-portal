//
//  PasswordStrengthTester.swift
//  Final Product
//
//  Created by Anushka Khatri on 4/11/23.
//

import Foundation

class PasswordStrengthTester
{
    func checkStrength(password: String) -> Int
    {
        let passwordLength = password.count
        var containsSymbol = false
        var containsUppercase = false
        
        for character in password
        {
            if "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(character)
            {
                containsUppercase = true
            }
            if "#@!$%&/()+?^;:_ç*,.-".contains(character)
            {
                containsSymbol = true
            }
        }
        
        if passwordLength > 12 && containsSymbol && containsUppercase
        {
            return 2
        }
        if passwordLength > 8 && containsSymbol || passwordLength > 8 && containsUppercase
        {
            return 1
        }
        else
        {
            return 0
        }
    }
}
