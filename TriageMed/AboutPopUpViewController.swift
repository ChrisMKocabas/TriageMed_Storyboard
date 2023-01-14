//
//  AboutPopUpViewController.swift
//  TriageMed
//
//  Created by Andreas Hartanto on 30Nov,2022.
//

import UIKit

class AboutPopUpViewController: UIViewController {

    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberDetail: UILabel!
    @IBOutlet weak var linkedinURL: UIButton!

    var name: String?
    var detail: String?
    var linkedinUrl: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberName.text = name
        memberDetail.text = detail
    
        // Do any additional setup after loading the view.
    }
    @IBAction func showLinkedinPage(_ sender: Any) {
        if let url = URL(string: linkedinUrl ){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)}
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
