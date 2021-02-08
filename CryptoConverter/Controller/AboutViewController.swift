//
//  AboutViewController.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/23/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var animatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedLabel.frame = CGRect(x: 50, y: 300, width: 250, height: 20)
        animatedLabel.textColor = .systemPink
        UIView.animate(withDuration: 5) {
            self.animatedLabel.frame = CGRect(x: 50, y: 400, width: 250, height: 20)
        }
    }
    
    
    @IBAction func emailUIButton(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
           let composeVC = MFMailComposeViewController()
           composeVC.mailComposeDelegate = self

           composeVC.setToRecipients(["akma0392@gmail.com"])
           composeVC.setSubject("Email Subject")
           composeVC.setMessageBody("", isHTML: true)

           self.present(composeVC, animated: true, completion: nil)

           } else {

               print("Cannot send mail")

           }
       }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        controller.dismiss(animated: true, completion: nil)

    }
    
}

