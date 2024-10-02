//
//  PhoneNumberView.swift
//  ATurkcellCustomView
//
//  Created by Sefa Aycicek on 2.10.2024.
//

import UIKit

class PhoneNumberView: UIView {
    @IBOutlet weak var txtCountryCode: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    var phoneNumber = ""
    // ()->Void
    var onApply: ((String?) -> Void)?

    @IBAction func onApplyTapped(_ sender: Any) {
        if let countryCode = txtCountryCode.text, !countryCode.isEmpty {
            phoneNumber += countryCode
        }
        if let phoneNumber = txtPhoneNumber.text, !phoneNumber.isEmpty {
            self.phoneNumber += " " + phoneNumber
        }
        print(phoneNumber)
        
        onApply?(phoneNumber)
    }
    
}
