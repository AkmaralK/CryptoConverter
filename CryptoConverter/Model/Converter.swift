//
//  Converter.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/9/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import RealmSwift

class Converter {
 var baseQuote: Quote
    
    init(baseQuote: Quote) {
        self.baseQuote = baseQuote
    }

    func convert(amount: Double, convertQuote: Quote) -> Double {
        return  Double((convertQuote.priceFloat*Float(amount))/(baseQuote.priceFloat)) 
    }
    
}
