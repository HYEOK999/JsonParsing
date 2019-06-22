//
//  ViewController.swift
//  passingdata01
//
//  Created by HYEOKBOOK on 22/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableVW: UITableView!
    
    private let kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getLoanData()
        // Do any additional setup after loading the view.
    }
    
    func getLoanData(){
        let loanURL = URL(string: kivaLoanURL)
        let request = URLRequest(url: loanURL!)
        let tesk = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            else{
                print("getdata: \(data)")
            }
        }
        tesk.resume()
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVW.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! DataTableViewCell
        cell.nameLB.text = "name"
        cell.amountLB.text = "$\(11)"
        cell.countryLB.text = "county"
        cell.useLB.text = "use"
        return cell
    }
    
}
