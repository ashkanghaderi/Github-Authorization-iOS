//
//  String+CustomTools.swift
//  BarandehShow
//
//  Created by Behrad Kazemi on 12/31/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func toAttributedString(color: UIColor, font: UIFont) -> NSMutableAttributedString{
        let attribute = [ NSAttributedString.Key.font: font ,NSAttributedString.Key.foregroundColor: color]
        let preString = NSMutableAttributedString(string: self, attributes: attribute)
        return preString
    }
    
    func isValidPhoneNumber() -> Bool {
        
        var phone = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if phone.isEmpty {
            return false
        }
        
        phone = self.transformNumbersToEng()
        
        let phoneRegex = "^09[0-9'@s]{9,9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result =  phoneTest.evaluate(with: phone)
        return result
    }
    
    func isValidEmail()-> Bool {
        
        var emailAddress = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if emailAddress.isEmpty {
            return false
        }
        
        emailAddress = self.transformNumbersToEng()
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: emailAddress)
    }
    func transformNumbersToEng() -> String {
        var tempStr = self
        
        for (idx, char) in self.farsiNumbers.enumerated() {
            tempStr = tempStr.replacingOccurrences(of: char, with: "\(idx)", options: NSString.CompareOptions.caseInsensitive, range: nil)
        }
        
        for (idx, char) in self.arabicNumbers.enumerated() {
            tempStr = tempStr.replacingOccurrences(of: char, with: "\(idx)", options: NSString.CompareOptions.caseInsensitive, range: nil)
        }
        
        return tempStr
    }
    
    func transformNumbersToFarsi() -> String {
        var tempStr = self
        for (idx, char) in self.farsiNumbers.enumerated() {
            tempStr = tempStr.replacingOccurrences(of: "\(idx)", with: char, options: NSString.CompareOptions.caseInsensitive, range: nil)
        }
        return tempStr
    }
    
    var farsiNumbers: [String] {
        return ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]
    }
    
    var arabicNumbers: [String] {
        return ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"]
    }
}
