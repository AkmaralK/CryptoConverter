//
//  File.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/22/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import RealmSwift

final class QuoteCaсhed {
    
    
    
    func generateToQuotesCashed(with quotes: [Quote]) -> [QuoteRealm] {
        var result = [QuoteRealm]()
        for quote in quotes {
            let quoteC = QuoteRealm()
            quoteC.name = quote.name
            quoteC.symbol = quote.symbol
            quoteC.logoUrl = quote.logoUrl
            quoteC.price = quote.price
            quoteC.priceFloat = quote.priceFloat
            result.append(quoteC)
        }
        return result
    }
    
    func saveQuoteCashed(with quoteCashedList: [QuoteRealm]) {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.add(quoteCashedList)
                print("saveQuoteCashed")
            }
        } catch {
            print(error)
        }
    }
    
    func getQuotesCashed() -> [QuoteRealm] {
        var result = [QuoteRealm]()
       do {
           let realm = try Realm()
           let results = realm.objects(QuoteRealm.self)
           result = Array(results)
        print("getQuotesCashed")
       } catch {
           print(error)
       }
       return result
    }
    
//    try! realm.write {
//        realm.delete(cheeseBook)
//    }

}
