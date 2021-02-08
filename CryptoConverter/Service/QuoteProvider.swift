//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/14/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation

final class QuoteProvider {
    
    var quotes = [Quote]()

    func fetchQuotes() {
         getQuotes { quotes in
                       DispatchQueue.main.async {
                        self.quotes = quotes
                           NotificationCenter.default.post(
                           name: NSNotification.Name(rawValue: Constants.QUOTES_UPDATE_NOTIFICATION),
                           object: quotes,
                           userInfo: nil)
                    }
            }
    }
    
    func getQuotes (completion: @escaping ([Quote]) -> Void) {
        let urlString = "https://api.nomics.com/v1/currencies/ticker?key=3c8c0907276523d0ff0e94c50657de0c&format=json&interval=5m&convert=USD&per-page=20&page=0"
        let url = URL(string: urlString)!
                       let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data {
                        let jsonDecoder = JSONDecoder()
                        do {
                            let quotes = try jsonDecoder.decode([Quote].self, from: data)
                            completion(quotes)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
            }
            dataTask.resume()
     }
    
}
    

