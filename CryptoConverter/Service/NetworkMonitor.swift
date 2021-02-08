//
//  NetworkMonitor.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/23/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Network
import Foundation

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true
    

    func startMonitoring() {
        
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                print("We're connected!")
                
            } else {
                print("No connection.")
                
            }
            let queue = DispatchQueue(label: "NetworkMonitor")
            self?.monitor.start(queue: queue)
        }
    }

    func stopMonitoring() {
        monitor.cancel()
        print("stop monitoring")
    }
}
