//
//  Loan.swift
//  passingdata01
//
//  Created by HYEOKBOOK on 22/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import Foundation

//struct Loan {
//    var name : String = ""
//    var country : String = ""
//    var use : String = ""
//    var amount : Int = 0
//}


struct Loan : Codable{
    var name : String = ""
    var country : String = ""
    var use : String = ""
    var amount : Int = 0
    
    enum CodingKeys : String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys : String, CodingKey{
        case country
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        use = try values.decode(String.self, forKey: .use)
        amount = try values.decode(Int.self, forKey: .amount)
        
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        country = try location.decode(String.self, forKey: .country)
    }
} // 하나의 데이터


struct LoanDataStore : Codable {
    var loans : [Loan]
} // 위에서 설정한 데이터를 모아놓음.
