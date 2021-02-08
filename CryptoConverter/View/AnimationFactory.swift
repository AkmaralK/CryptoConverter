//
//  AnimationFactory.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/30/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import UIKit

typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

enum AnimationFactory {

    static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
}
