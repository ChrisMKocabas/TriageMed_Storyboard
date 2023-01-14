//
//  GettingStartedCompletionViewController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-26.
//

import UIKit
import CoreData

class GettingStartedCompletionViewController: UIViewController {

 
    @IBOutlet weak var usernameField: UILabel!
    
    let context: NSManagedObjectContext! = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    
    var profiles:Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProfile()
        
        

        // Do any additional setup after loading the view.
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
                               usernameField.text = name
                           }
                       }
                   }
               } catch {
                   print("Failed to fetch data request.")
               }
        }
        
    
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    @IBAction func proceedToTabbar(_ sender: UIButton) {
//Here is where we create an instance of our view controller. instantiateViewController(withIdentifier:) will create an instance of the view controller.

        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "showTabBarController") as! TabBarController
        tabBarController.modalPresentationStyle = .custom
        tabBarController.modalTransitionStyle = .crossDissolve
        UIApplication.shared.windows.first!.rootViewController = tabBarController
        self.present(tabBarController, animated: true, completion: nil)
        
        
        
    
    }
    
    @IBAction func backtoSecondStep(_ sender: UIButton) {
        performSegue(withIdentifier: "gobacktoGettingStarted2", sender: nil)
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
