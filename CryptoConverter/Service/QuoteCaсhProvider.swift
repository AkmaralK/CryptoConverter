//
//  File.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/22/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import RealmSwift

final class QuoteCaсhProvider {
    

   func convertToQuotesCaсhed(quotes: [Quote]) -> [QuoteRealm] {
        var result = [QuoteRealm]()
        for quote in quotes {
            let quoteC = QuoteRealm.init(from: quote)
            result.append(quoteC)
        }
        return result
    }
    
    func saveQuoteCaсhed(with quotes: [Quote]) {
        do {
            let quoteCaсhedList = convertToQuotesCaсhed(quotes: quotes)
            let realm = try! Realm()
            try realm.write {
                realm.add(quoteCaсhedList)
                print("saveQuoteCaсhed")
            }
        } catch {
            print(error)
        }
    }
     
    
    func clearQuoteCashed() {
        do {
            let realm = try Realm()
            let quoteCaсhedList = realm.objects(QuoteRealm.self)
            try! realm.write {
                realm.delete(quoteCaсhedList)
                print("clearQuoteCashed")
            }
        } catch let error as NSError {
            // handle error
            print("error - \(error.localizedDescription)")
        }
    }
    
}
