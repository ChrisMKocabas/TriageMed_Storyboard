//
//  DiagnosticPopUpViewController.swift
//  TriageMed
//
//  Created by Andreas Hartanto on 30Nov,2022.
//

import UIKit

class DiagnosticPopUpViewController: UIViewController {
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var call: UIButton!
    @IBOutlet weak var lastResults: UIButton!
    
    @IBOutlet weak var addressTxtLabel: UILabel!
    @IBOutlet weak var phonenumberTxtLabel: UILabel!
    
    var contactName: String?
    var phoneNumber: String!
    var address: String?
    var addessTxt: String = "Address: "
    var phoneTxt: String? = "Phone No: "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactLabel.text = contactName
        phoneNumberLabel.text = phoneNumber
        addressLabel.text = address
        addressTxtLabel.text = addessTxt
        phonenumberTxtLabel.text = phoneTxt
        // Do any additional setup after loading the view.
    }
    

    @IBAction func call911(_ sender: Any) {
        // Calling doesnt work on simulator as it doesnt have the phone app to redirect the call
        if let url = URL(string: "tel://\(phoneNumber)"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
    }
    
    
    @IBAction func showLastResult(_ sender: Any) {
        let Diagnostic3ViewController = self.storyboard?.instantiateViewController(withIdentifier: "lastResult") as! Diagnostic3ViewController
        Diagnostic3ViewController.modalPresentationStyle = .automatic
        Diagnostic3ViewController.modalTransitionStyle = .coverVertical
        self.present(Diagnostic3ViewController, animated: true, completion: nil)
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
