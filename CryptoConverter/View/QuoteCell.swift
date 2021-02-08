//
//  QuoteCell.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/16/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import UIKit
import Kingfisher

final class QuoteCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var logoImagecell: UIImageView!
    @IBOutlet private var titleLabel1: UILabel!
    @IBOutlet private var rankLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    
    func configure(with quote: Quote, rank: Int) {
        titleLabel.text = quote.symbol
        nameLabel.text = quote.name
        titleLabel1.text = "\(quote.priceFloat)"
        rankLabel.text = "\(rank)"
        let url = URL(string: quote.logoUrl)
        logoImagecell.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
    }
}
