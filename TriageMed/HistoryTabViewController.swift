//
//  HistoryTabViewController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-27.
//

import UIKit
import CoreData


private let spacing:CGFloat = 16.0

/// <#Description#>
class HistoryTabViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let diagnosis:[Int: String] = [0: "Fever", 1: "Food poisioning",2: "Migrain", 3: "Acne",4: "Nothing", 5: "Low Grade Fever", 6: "Pancreatitis", 7: "Allergies", 8: "Anxiety",9: "Earche", 10: "Malaria", 11: "Polio", 12: "Dengue"]
    let diagnosisThumbs:[Int: String] = [0: "ic_pneumonia", 1: "ic_vomiting",2: "ic_migraine", 3: "ic_acne",4: "ic_tired", 5: "ic_sick", 6: "ic_kidney", 7: "ic_loss_of_sense_of_taste", 8: "ic_dizziness",9: "ic_muscle_pain", 10: "ic_body_pain", 11: "ic_muscle_pain", 12: "ic_sick"]
    
    
    var diagnosisCoreData: [NSManagedObject] = []

    
    @IBOutlet var historyTableView: UITableView!
    @IBOutlet weak var historyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.historyCollectionView.delegate = self
        self.historyCollectionView.dataSource = self
        historyCollectionView.layer.cornerRadius=20
        historyCollectionView.layer.backgroundColor = UIColor(named: "AccentColor")?.cgColor
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.historyCollectionView?.collectionViewLayout = layout
        
        historyCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diagnosis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCell", for: indexPath) as! HistoryCollectionViewCell
        
        cell.title.text = diagnosis[indexPath.row]
        cell.thumb.image = UIImage(named: diagnosisThumbs[indexPath.row] ?? "ic_sick")
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.historyCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            print("\(width) ")
            return CGSize(width: (width * 1.3), height: (width*1.3))
        }else{
            return CGSize(width: 0, height: 0)
        }
        
        
    }
    
    
    
    /////    // 3
    //    func collectionView(
    //      _ collectionView: UICollectionView,
    //      layout collectionViewLayout: UICollectionViewLayout,
    //      insetForSectionAt section: Int
    //    ) -> UIEdgeInsets {
    //      return sectionInsets
    //    }
    
    // 4
    //    func collectionView(
    //      _ collectionView: UICollectionView,
    //      layout collectionViewLayout: UICollectionViewLayout,
    //      minimumLineSpacingForSectionAt section: Int
    //    ) -> CGFloat {
    //      return sectionInsets.left
    //    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        //1
//        guard let appDelegate =
//                UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Diagnosis")
//
//        do {
//            diagnosisCoreData = try managedContext.fetch(fetchRequest)
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
//
}
