//
//  TabBarController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-27.
//
// IMPORTANT : Please do not change anything in this controller. <-----------
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var historyEmpty=true
    var controller: UIViewController?
    lazy var nohistory:UIViewController = {return((storyboard?.instantiateViewController(withIdentifier: "empHistory"))! as UIViewController)}()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.unselectedItemTintColor = UIColor.white
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        var backup = tabBarController.tabBar.selectedItem?.standardAppearance
        if (viewController.tabBarController?.selectedIndex == 1 && historyEmpty == true) {
            
            
            controller = self.viewControllers?[1]
            self.viewControllers?.remove(at: 1)
            self.viewControllers?.insert(nohistory, at: 1)  
            tabBarController.tabBar.items![1].image = UIImage(named: "history_icon")
            tabBarController.tabBar.items![1].selectedImage = UIImage(named: "history_icon")
            tabBarController.tabBar.items![1].title = "History"
            tabBarController.tabBar.items![1].standardAppearance = backup
            tabBarController.selectedIndex = 1
            historyEmpty=false
            print("selected")
            
            
        }else if (viewController.tabBarController?.selectedIndex == 1 && historyEmpty == false){
            print("there is nothing to do")
            self.viewControllers?.remove(at: 1)
            self.viewControllers?.insert(controller!, at: 1)
//            tabBarController.tabBar.items![1].image = UIImage(named: "history_icon")
//            tabBarController.tabBar.items![1].selectedImage = UIImage(named: "history_icon")
//            tabBarController.tabBar.items![1].standardAppearance = backup
            tabBarController.selectedIndex = 1
           
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

}
