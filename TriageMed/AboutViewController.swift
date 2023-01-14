//
//  AboutViewController.swift
//  TriageMed
//
//  Created by Andreas Hartanto on 2022-12-14.
//

import UIKit

class AboutViewController: UIViewController {

    var name = ""
    var detail = ""
    var linkedinUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AndreasPageInformation(_ sender: Any) {
        name = "Andreas Hartanto"
        detail = "Fullstack Developer with 2 years academic experience with a focus on mobile development. Andreas has more than 5 years as IT project manager and experience in tech industry."
        linkedinUrl = "https://www.linkedin.com/in/andreashartanto/"
    }
    
    @IBAction func AnkitPageInformation(_ sender: Any) {
        name = "Ankitgiri Gusai"
        detail = "Android | Firebase | React Native | Tech Enthusiastic I have in-depth knowledge of Kotlin, Android lifecycle, Jetpack components, Bluetooth stack, multi-threading, networking, and Firebase."
        linkedinUrl = "https://www.linkedin.com/in/ankitgusai19"
    }
    
    
    @IBAction func MuhammedPageInformation(_ sender: Any) {
        name = "Muhammed Kocabas"
        detail = "Mobile and Full Stack Web Developer with Machine Learning and Big Data knowledge. API explorer. Cocoapod publisher. Has experience in both customer and product facing IT Project Management."
        linkedinUrl = "https://www.linkedin.com/in/muhammed-kocabas/"
    }
    
    @IBAction func TatiPageInformation(_ sender: Any) {
        name = "Tatiana Trofimchuk"
        detail = "iOS and Android Application Developer. She is an experienced project management and data management professional, currently focusing on mobile and web app development."
        linkedinUrl = "https://www.linkedin.com/in/tatianatrofimchuk/"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as? AboutPopUpViewController
            destinationVC?.name = name
            destinationVC?.detail = detail
            destinationVC?.linkedinUrl = linkedinUrl
    
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
