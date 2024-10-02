//
//  ViewController.swift
//  ATurkcellCustomView
//
//  Created by Sefa Aycicek on 2.10.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addPhoneNumberView()
    }

    func addPhoneNumberView() {
        if let nib = Bundle.main.loadNibNamed("PhoneNumberView", owner: self, options: nil)?.first as? PhoneNumberView {
            nib.translatesAutoresizingMaskIntoConstraints = false
            self.view .addSubview(nib)
            
            NSLayoutConstraint.activate([
                nib.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                nib.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                nib.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
                nib.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
            ])
            
            nib.onApply = { phoneNumber in
                
            }
        }
    }
}

