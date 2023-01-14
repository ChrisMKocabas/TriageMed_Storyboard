//
//  Diagnostic3ViewController.swift
//  TriageMed
//
//  Created by Tati on 12/14/22.
//

import UIKit

class Diagnostic3ViewController: UIViewController {
    @IBOutlet var imgResult: UIImageView!
    @IBOutlet var lblResult: UILabel!
    
    @IBOutlet var imageResult: UIImageView!
    @IBOutlet var headerResult: UILabel!
    
    @IBOutlet var textResult: UILabel!
    
    @IBOutlet var btnRedo: UIButton!
    @IBAction func btnRedo(_ sender: UIButton) {
    }
    
    @IBOutlet var btnContact: UIButton!
    @IBAction func btnContact(_ sender: UIButton) {
    }
    
    var imageNumber = 0
    var messageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var btnDetails: UIButton!
    @IBAction func btnDetails(_ sender: UIButton) {
    
        let diagnosis = [
            "Flu: You are sick with Influenza Virus.",
            "Covid: You are sick with COVID 19.",
            "Cold: You have a common cold."
        ]

        
        textResult.text = diagnosis[Int.random(in: 0...diagnosis.count-1)]
        imageResult.image = UIImage(named: "image\(Int.random(in: 1...3))")
        
    }


}
