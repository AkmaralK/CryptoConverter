//
//  Quote.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/9/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
struct Quote: Decodable {
    
    var id: String?
    var currency: String?
    var name: String
    var symbol: String
    var logoUrl: String
    var status: String?
    var price: String
    var priceFloat: Float {
        Float(price) ?? 0
    }
    var priceDate: String?
    var priceTimestamp: String?
    var circulatingSupply: String?
    var maxSupply: String?
    var marketCap: String?
    var numExchanges: String?
    var numPairs: String?
    var numPairsUnmapped: String?
    var firstCandle: String?
    var firstTrade: String?
    var firstOrderBook: String?
    var rank: String?
    var rankDelta: String?
    var high: String?
    var highTimestamp: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case currency = "currency"
        case name
        case symbol
        case logoUrl = "logo_url"
        case status
        case price
        case priceDate = "price_date"
        case priceTimestamp = "price_timestamp"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
        case marketCap = "market_cap"
        case numExchanges = "num_exchanges"
        case numPairs = "num_pairs"
        case numPairsUnmapped = "num_pairs_unmapped"
        case firstCandle = "first_candle"
        case firstTrade = "first_trade"
        case firstOrderBook = "first_order_book"
        case rank
        case rankDelta = "rank_delta"
        case high
        case highTimestamp = "high_timestamp"
        
    }
    
    init(from quote: QuoteRealm) {
        // super.init()

       id = quote.id
       name = quote.name
       symbol = quote.symbol
       logoUrl = quote.logoUrl
       price = quote.price
       // priceFloat = quote.priceFloat
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
