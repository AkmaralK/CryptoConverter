//
//  QuoteCashed.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/21/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var symbol: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var logoUrl: String = ""
    @objc dynamic var priceFloat: Float = 0.0
    @objc dynamic var id: String? = nil 
    @objc dynamic var currency: String? = nil
    @objc dynamic var status: String? = nil
    @objc dynamic var priceDate: String? = nil
    @objc dynamic var priceTimestamp: String? = nil
    @objc dynamic var circulatingSupply: String? = nil
    @objc dynamic var maxSupply: String? = nil
    @objc dynamic var marketCap: String? = nil
    @objc dynamic var numExchanges: String? = nil
    @objc dynamic var numPairs: String? = nil
    @objc dynamic var numPairsUnmapped: String? = nil
    @objc dynamic var firstCandle: String? = nil
    @objc dynamic var firstTrade: String? = nil
    @objc dynamic var firstOrderBook: String? = nil
    @objc dynamic var rank: String? = nil
    @objc dynamic var rankDelta: String? = nil
    @objc dynamic var high: String? = nil
    @objc dynamic var highTimestamp: String? = nil
    
    convenience init(from quote: Quote) {
      self.init()

           id = quote.id
           name = quote.name
           symbol = quote.symbol
           logoUrl = quote.logoUrl
           price = quote.price
           priceFloat = quote.priceFloat
           id = quote.id
           currency = quote.currency
           status = quote.status
           priceDate = quote.priceDate
           priceTimestamp = quote.priceTimestamp
           circulatingSupply = quote.circulatingSupply
           maxSupply = quote.maxSupply
           marketCap = quote.marketCap
           numExchanges = quote.numExchanges
           numPairs = quote.numPairs
           numPairsUnmapped = quote.numPairsUnmapped
           firstCandle = quote.firstCandle
           firstTrade = quote.firstTrade
           firstOrderBook = quote.firstOrderBook
           rank = quote.rank
           rankDelta = quote.rankDelta
           high = quote.high
           highTimestamp = quote.highTimestamp
   }

}


