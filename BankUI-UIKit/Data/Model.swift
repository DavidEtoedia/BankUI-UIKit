//
//  Model.swift
//  BankUI-UIKit
//
//  Created by Inyene Etoedia on 11/09/2024.
//

import Foundation



struct BeneficiariesDTO{
    let name: String
    let image: String
    let bankName : String
    
    static  func allBeneficiaries()-> [BeneficiariesDTO] {
      var result = [
        BeneficiariesDTO(name: "Alex Johnson", image: "Ellipse 3", bankName: "Chase Bank"),
        BeneficiariesDTO(name: "Maria Smith", image: "Ellipse 4", bankName: "Bank of America"),
        BeneficiariesDTO(name: "James O'Neill", image: "Ellipse 5", bankName: "Wells Fargo"),
        BeneficiariesDTO(name: "Sophia Martinez", image: "Ellipse 6", bankName: "Citibank"),
        BeneficiariesDTO(name: "Daniel Brown", image: "Ellipse 7", bankName: "Capital One"),
        BeneficiariesDTO(name: "Lily Chen", image: "Ellipse 8", bankName: "PNC Bank"),
        BeneficiariesDTO(name: "Oliver Green", image: "Ellipse 9", bankName: "TD Bank"),
        BeneficiariesDTO(name: "Emily Davis", image: "Ellipse 10", bankName: "U.S. Bank"),
        BeneficiariesDTO(name: "Lucas Taylor", image: "Ellipse 11", bankName: "Regions Bank"),
        BeneficiariesDTO(name: "Ava Wilson", image: "Ellipse 12", bankName: "HSBC")
      ]
        
      return result
    }
}


