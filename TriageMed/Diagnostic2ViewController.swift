//
//  Diagnostic2ViewController.swift
//  TriageMed
//
//  Created by Tati on 12/14/22.
//

import UIKit

//array of symptoms
let symptoms = ["Abdominal Pain",
                "Acne",
                "Body pain",
                "Pain around bone",
                "Chest pain",
                "Conjunctivitis",
                "Constipation",
                "Cough",
                "Diarrhea",
                "Dizziness",
                "Gastric",
                "Herpes",
                "Kidney pain",
                "Lack of appetite",
                "Loss of color in toes",
                "Loss of sense of taste",
                "Lower back pain",
                "Migraine",
                "Muscle pain",
                "Difficulty breathing",
                "Rashes",
                "Runny nose",
                "Weakness",
                "Sneezing",
                "Sore throat",
                "Stomach bug",
                "Tired",
                "Upper back pain",
                "Vomiting"]

//array of selected symptoms
var selectedArray: [String] = []


class Diagnostic2ViewController: UIViewController {
    @IBOutlet var lblSymptoms: UILabel!
    
    @IBOutlet var txtBox: UILabel!
    
    @IBOutlet var btnNext: UIButton!
    @IBAction func btnNext(_ sender: UIButton) {
    }
    
    @IBOutlet var btnGoback: UIButton!
    @IBAction func btnGoback(_ sender: UIButton) {
    }
    
    @IBOutlet var tableviewSymptoms: UITableView!
        var selectedSymptoms = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    private func blankselectedSymptoms()
    {
        for i in 0...symptoms.count
            {
            selectedSymptoms[i]=false
            }
    }
}



extension Diagnostic2ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return number of symptoms
        return symptoms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosticTableViewCell", for: indexPath)
        //get symptom from array
        cell.textLabel?.text = symptoms[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //add selected to array
        selectedArray.append(symptoms[indexPath.row])
        print(selectedArray)
        //add background color when selected
        let selectedCell:UITableViewCell = tableviewSymptoms.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor=UIColor.green
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //delete if deselected
        if let index = selectedArray.index(of: symptoms[indexPath.row]) {
                    selectedArray.remove(at: index)
        //white out background color when deselected
        let selectedCell:UITableViewCell = tableviewSymptoms.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor=UIColor.white
    }
    
}
    
}
