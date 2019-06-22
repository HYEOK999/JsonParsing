//
//  DataTableViewCell.swift
//  passingdata01
//
//  Created by HYEOKBOOK on 22/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLB: UILabel!
    
    @IBOutlet weak var countryLB: UILabel!
    
    @IBOutlet weak var useLB: UILabel!
    
    @IBOutlet weak var amountLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
