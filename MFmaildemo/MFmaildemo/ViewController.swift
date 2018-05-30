//
//  ViewController.swift
//  MFmaildemo
//
//  Created by agile on 4/23/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func objMailBtn(_ sender: UIButton) {
        
        let MailComposeViewController = ConfigureMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(MailComposeViewController, animated: true, completion: nil)
        }
        else{
            self.ShowMailErrorAlert()
        }
        
        
    }
    
    func ConfigureMailComposeViewController() -> MFMailComposeViewController {
        let mailcomposervc = MFMailComposeViewController()
        
        mailcomposervc.setToRecipients(["ankola@gmail.com"])
        mailcomposervc.setSubject("app Feedback")
        mailcomposervc.setMessageBody("Hello \n Good Morning", isHTML: false)
        return mailcomposervc
    }
    
    func ShowMailErrorAlert() {
        let sendmailerroralert = UIAlertView(title: "Could not send Mail", message: "Your Device Could not send Mail", delegate: self, cancelButtonTitle: "CancelBtn")
        sendmailerroralert.show()
    }
    
    func mailcomposerController(Controller : MFMailComposeViewController, DidFinishWithResult : MFMailComposeResult, Error : NSError) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

