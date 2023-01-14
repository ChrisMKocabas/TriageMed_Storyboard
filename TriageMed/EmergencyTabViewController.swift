//
//  EmergencyTabViewController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-26.
//

import UIKit

class EmergencyTabViewController: UIViewController {

    var phoneNumber = ""
    var address = ""
    var contactLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showLastResults(_ sender: Any) {
        
        let Diagnostic3ViewController = self.storyboard?.instantiateViewController(withIdentifier: "lastResult") as! Diagnostic3ViewController
        Diagnostic3ViewController.modalPresentationStyle = .automatic
        Diagnostic3ViewController.modalTransitionStyle = .coverVertical
        self.present(Diagnostic3ViewController, animated: true, completion: nil)
    }
    
    @IBAction func hospitalContacts(_ sender: Any) {
        contactLabel = "Toronto General Hospital"
        phoneNumber = "(416) 340-3131"
        address = "200 Elizabeth St, Toronto, ON M5G 2C4"
    }
    
    
    @IBAction func PharmacyContacts(_ sender: UIButton) {
        contactLabel = "Shoppers Drug Mart"
        phoneNumber = "(800) 746-7737"
        address = "236 Bloor St W, Toronto, ON M5S 1T8"
    }
    
    @IBAction func emergencyContacts(_ sender: Any) {
        contactLabel = "Call 911 immediately by pressing the call button below"

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "hospitalContact"){
            let destinationVC = segue.destination as? DiagnosticPopUpViewController
            destinationVC?.phoneNumber = phoneNumber
            destinationVC?.address = address
            destinationVC?.contactName = contactLabel

        }
        
        if (segue.identifier == "pharmacyContact"){
            let destinationVC = segue.destination as? DiagnosticPopUpViewController
            destinationVC?.phoneNumber = phoneNumber
            destinationVC?.address = address
            destinationVC?.contactName = contactLabel
        }
        
        if (segue.identifier == "emergencyContact"){
            let destinationVC = segue.destination as? DiagnosticPopUpViewController
            destinationVC?.phoneTxt = ""
            destinationVC?.addessTxt = ""
            destinationVC?.contactName = contactLabel

        }
        
    }
    
    @IBAction func unwindtoContacts(segue:UIStoryboardSegue){
    }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


