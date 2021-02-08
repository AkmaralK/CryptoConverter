//
//  QuoteDetailViewController.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/17/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import UIKit
import Kingfisher

class QuoteDetailViewController: UIViewController {

    @IBOutlet private var logoImage: UIImageView!
    @IBOutlet private var nameLable: UILabel!
    @IBOutlet private var symbolLable: UILabel!
    @IBOutlet private var idLable: UILabel!
    @IBOutlet private var currencyLable: UILabel!
    @IBOutlet private var statusLable: UILabel!
    @IBOutlet private var priceLable: UILabel!
    @IBOutlet private var priceData: UILabel!
    @IBOutlet private var priceTimeLable: UILabel!
    @IBOutlet private var circulatingSupLable: UILabel!
    @IBOutlet private var maxSupLable: UILabel!
    @IBOutlet private var marketCapLable: UILabel!
    @IBOutlet private var numExchLable: UILabel!
    @IBOutlet private var numPairsLable: UILabel!
    @IBOutlet private var numPaisrUnmLable: UILabel!
    @IBOutlet private var firstCandleLable: UILabel!
    @IBOutlet private var firstTradeLable: UILabel!
    @IBOutlet private var firstOrderBookLable: UILabel!
    @IBOutlet private var rankLable: UILabel!
    @IBOutlet private var rankDataLable: UILabel!
    @IBOutlet private var highLable: UILabel!
    @IBOutlet private var highTimeStampLable: UILabel!
    
    
    var quote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let quote = quote {
            nameLable.text = quote.name
            let url = URL(string: quote.logoUrl)
            logoImage.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
            symbolLable.text = quote.symbol
            idLable.text = quote.id
            currencyLable.text = quote.currency
            statusLable.text = quote.status
            priceLable.text = quote.price
            priceData.text = quote.priceDate
            priceTimeLable.text = quote.priceTimestamp
            circulatingSupLable.text = quote.circulatingSupply
            maxSupLable.text = quote.maxSupply
            marketCapLable.text = quote.marketCap
            numExchLable.text = quote.numExchanges
            numPairsLable.text = quote.numPairs
            numPaisrUnmLable.text = quote.numPairsUnmapped
            firstCandleLable.text = quote.firstCandle
            firstTradeLable.text = quote.firstTrade
            firstOrderBookLable.text = quote.firstOrderBook
            rankLable.text = quote.rank
            rankDataLable.text = quote.rankDelta
            highLable.text = quote.high
            highTimeStampLable.text = quote.highTimestamp
        }
    }

}

