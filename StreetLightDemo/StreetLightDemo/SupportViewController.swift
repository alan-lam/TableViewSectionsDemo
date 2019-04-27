//
//  SupportViewController.swift
//  StreetLightDemo
//
//  Created by Alan Lam on 4/27/19.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit
import MessageUI

class SupportViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func doCustomerPhoneCall(_ sender: Any) {
        let supportNumber = "1-800-123-4567"
        
        guard let number = URL(string: "tel://" + supportNumber) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func doCustomerEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() == false {
            let vc = UIAlertController(title: "Warning", message: "This device does not have email", preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(vc, animated: true, completion: nil)
            return
        }
        let vc = MFMailComposeViewController()
        vc.setSubject("Customer Support")
        vc.setToRecipients(["support@demo.com"])
        vc.setMessageBody("Put your customer support request here.", isHTML: false)
        vc.mailComposeDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled: print("canceled")
        case .failed: print("failed")
        case .saved: print("saved")
        case .sent: print("sent")
        @unknown default:
            print("default")
        }
        
        if let e = error {
            print(e)
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doNetworkActivity(_ sender: UISwitch) {
        if sender.isOn {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
