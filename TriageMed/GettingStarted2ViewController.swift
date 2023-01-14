//
//  GettingStarted2ViewController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-26.
//

import UIKit
import CoreData

class GettingStarted2ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var fullname: UITextField!
    
    @IBOutlet weak var Age: UITextField!
    
    @IBOutlet weak var bloodType: UITextField!
    
    @IBOutlet weak var rhFactor: UITextField!
    
    let context: NSManagedObjectContext! = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //required for age field integer entry check 
        Age.delegate = self

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func pushFinalScreen(_ sender: UIButton) {
        
        let bloodArray = ["A", "B", "AB", "0", "a", "b", "ab"]
        let rhArray = ["+","-"]
        
        if fullname.text?.count ?? 0 < 2 || fullname.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Please enter a proper name!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        } else if !bloodArray.contains(bloodType.text ??  "empty") {
            let alert = UIAlertController(title: "Alert", message: "Invalid blood type!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        } else if !rhArray.contains(rhFactor.text ??  "empty") {
            let alert = UIAlertController(title: "Alert", message: "Invalid blood rh factor. Allowed options: + or -", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
                    
        } else {
            let newProfile = Profile(context: self.context)
            newProfile.fullname = fullname.text
            if let agetext = Age.text, let ageInt=Int64(agetext) {
                newProfile.age = ageInt
            }
            newProfile.bloodType = bloodType.text
            newProfile.rhFactor = rhFactor.text
            try! self.context.save()
            print("profile saved")
            performSegue(withIdentifier: "completeGettingStarted", sender: nil)
        }

        
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        
        performSegue(withIdentifier: "gobacktoGettingStarted1", sender: nil)
    }
    
    //MARK - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == Age {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
