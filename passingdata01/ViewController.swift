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
    
    private var loans = [Loan]()
    
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
                if let data = data{
                    self.loans = self.parseJsonData(data: data)
                    
                    //새로고침
                    OperationQueue.main.addOperation {
                        self.tableVW.reloadData()
                    }
                }
            }
        }
        tesk.resume()
    }
    
    func parseJsonData(data: Data) -> [Loan] {
        var loans = [Loan]()
        
        do{
            //json 형태로 변환
           let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            let jsonLoans = jsonResult!["loans"] as! [AnyObject]
            
            for jsonLoan in jsonLoans{
                var loan  = Loan() // 각각 하나의 항목
                
                loan.name = jsonLoan["name"] as! String
                loan.use = jsonLoan["use"] as! String
                loan.amount = jsonLoan["loan_amount"] as! Int
                
                let location = jsonLoan["location"] as! [String:AnyObject]
                
                loan.country = location["country"] as! String
                
                loans.append(loan)
            }
            
        } catch {
            print(error)
        }
        
        return loans
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVW.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! DataTableViewCell
        cell.nameLB.text = loans[indexPath.row].name
        cell.amountLB.text = "$\(loans[indexPath.row].amount)"
        cell.countryLB.text = loans[indexPath.row].country
        cell.useLB.text = loans[indexPath.row].use
        return cell
    }
    
}
