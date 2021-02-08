//
//  Animator.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/30/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import UIKit

final class Animator {
    private var hasAnimatedAllCells = false
    private let animation: Animation

    init(animation: @escaping Animation) {
        self.animation = animation
    }

    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else {
            return
        }

        animation(cell, indexPath, tableView)

        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)  
    }
}
