//
//  DiagnosticTabViewController.swift
//  TriageMed
//
//  Created by Muhammed Kocabas on 2022-11-26.
//

import UIKit

class DiagnosticTabViewController: UIViewController {
    @IBOutlet var diagnosticIcon: UIButton!
    
    @IBOutlet var diagnosticHeader: UILabel!
    
    @IBOutlet var diagnosticImage: UIImageView!
    
    @IBOutlet var btnStartDiagnostic: UIButton!
    
    @IBAction func btnStartDiagnostic(_ sender: Any) {
    }
    
    @IBAction func btnAbout(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindtoSymptoms(segue:UIStoryboardSegue){
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
