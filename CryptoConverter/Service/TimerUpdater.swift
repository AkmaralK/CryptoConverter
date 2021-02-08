//
//  TimerUpdater.swift
//  CryptoConverter
//
//  Created by Kozhakhmet Myrzagali on 11/13/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation

protocol TimerUpdaterDelegate {
    func updateTimer()
}

class TimerUpdater{
    private var timer: Timer!
    private var delegate: TimerUpdaterDelegate!
    
    required init (delegate: TimerUpdaterDelegate){
        timer = Timer()
        self.delegate = delegate
    }
    
    func start() {
        timer = Timer.scheduledTimer(
                   timeInterval: 1.0,
                   target: self,
                   selector: #selector(updateTimer),
                   userInfo: nil,
                   repeats: true)
    }
    
    @objc func updateTimer() {
        delegate.updateTimer()
    }
}
