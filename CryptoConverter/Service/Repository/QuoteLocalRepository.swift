//
//  QuoteLocalRepository.swift
//  CryptoConverter
//
//  Created by Akmaral on 11/28/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import Foundation
import RealmSwift

enum NetworkError: Error {
    case notFound
    case parsingError
}

protocol AbstractQuoteRepository: AnyObject {
    func getQuotes(completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}

final class QuoteRepository {
    private var quoteRepository: AbstractQuoteRepository?

    func getQuotes() -> [Quote] {

        var quoteList = [Quote]()
        NetworkMonitor.shared.startMonitoring()
        if NetworkMonitor.shared.isReachable {
            quoteRepository = QuoteRemoteRepository()
        } else {
            quoteRepository = QuoteLocalRepository()
        }
        
        quoteRepository?.getQuotes(completion: { quotes in
            switch quotes {
            case .failure(let error):
               // print("error")
               print(error)
            case .success(let quotes):
               quoteList = quotes
              // print("success quotes")
            }
        })

        return quoteList
    }
    
}

final class QuoteLocalRepository: AbstractQuoteRepository {

    func getQuotes(completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var result = [Quote]()
        do {
            let realm = try Realm()
            let results = realm.objects(QuoteRealm.self)
            let tempResult = Array(results)
            for itemRealm in tempResult {
                result.append(Quote.init(from: itemRealm))
            }
         print("getQuotesCaсhed")
        } catch {
            guard let nError = error as? NetworkError else {
                return
            }
            completion(.failure(nError))
        }
        completion(.success(result))
    }

}

final class QuoteRemoteRepository: AbstractQuoteRepository {

    func getQuotes(completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let urlString = "https://api.nomics.com/v1/currencies/ticker?key=3c8c0907276523d0ff0e94c50657de0c&format=json&interval=5m&convert=USD&per-page=20&page=0"
        let url = URL(string: urlString)!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(NetworkError.notFound))
                return
            }
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let quotes = try jsonDecoder.decode([Quote].self, from: data)
                    var qs = [Quote]()
                    for item in quotes {
                        qs.append(item)
                    }
                    completion(.success(qs))
                } catch {
                    completion(.failure(.parsingError))
                }
            }
        }
        dataTask.resume()
    }

}
