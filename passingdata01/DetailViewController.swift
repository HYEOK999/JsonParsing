//
//  DetailViewController.swift
//  passingdata01
//
//  Created by HYEOKBOOK on 22/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var countryLB: UILabel!
    @IBOutlet weak var useLB: UILabel!
    @IBOutlet weak var amountLB: UILabel!
    
    
    var name = ""
    var country = ""
    var use = ""
    var amount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLB.text = name
        countryLB.text = country
        useLB.text = use
        amountLB.text = "\(amount)"
        // Do any additional setup after loading the view.
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
