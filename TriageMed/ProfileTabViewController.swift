//
//  ProfileTabViewController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-26.
//

import UIKit
import CoreData

class ProfileTabViewController: UIViewController {
    @IBOutlet var userNameLable: UILabel!
    @IBOutlet var userNameLableContainer: UIView!
    @IBOutlet var userDetailLableContainer: UIView!
    @IBOutlet var dignosisDetailLableContainer: UIView!
    @IBOutlet weak var bloodGroupLabel: UILabel!
    
    @IBOutlet weak var userThumbImage: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var rhFactorLabel: UILabel!
    let context: NSManagedObjectContext! = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLableContainer.layer.cornerRadius=20
        userNameLableContainer.layer.backgroundColor = UIColor(named: "profile_name_bg")?.cgColor
        userDetailLableContainer.layer.cornerRadius=20
        userDetailLableContainer.layer.backgroundColor = UIColor.systemGray6.cgColor
        dignosisDetailLableContainer.layer.cornerRadius=20
        dignosisDetailLableContainer.layer.backgroundColor = UIColor(named: "AccentColor")?.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchProfile()
    }
    
    func fetchProfile(){

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        let allElementsCount = try! context.count(for: request)
        request.fetchLimit = 1
        request.fetchOffset = allElementsCount - 1
        request.returnsObjectsAsFaults = false
        
        do {
            if let results = try context.fetch(request) as? [NSManagedObject] {
                       for result in results {
                           if let name = result.value(forKey: "fullname") as? String {
                               userNameLable.text = name
                           }
                           
                           if let bloodType = result.value(forKey: "bloodType") as? String {
                               bloodGroupLabel.text = bloodType
                           }
                           
                           if let rhFactor = result.value(forKey: "rhFactor") as? String {
                               rhFactorLabel.text = rhFactor
                           }
                           
                           if let age = result.value(forKey: "age") as? Int64 {
                               ageLabel.text = "\(age)"
                           }
                           
//                           if let imageData = result.value(forKey: "userImage") as? Data {
//                               userThumbImage.image = UIImage(data: imageData)
//                           }
                           
                       }
                   }
               } catch {
                   print("Failed to fetch data request.")
               }
        }
        
    
}
