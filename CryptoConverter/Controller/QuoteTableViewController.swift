//
//  QuoteDetailViewController.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/16/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import AVFoundation
import UIKit


final class QuoteTableViewController: UITableViewController, UISearchBarDelegate {
    

    @IBOutlet private var searchBar: UISearchBar!
    private var filteredQuotes = [Quote]()
    private var quotes = [Quote]()
    private var quoteProvider = QuoteProvider()
    //private var timer: TimerUpdater?
    var selectQuoteMode: Int?
    private var quoteCached = QuoteCaсhProvider()
    private var quoteRepository = QuoteRepository()
    private var clickCell = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateQuotes),
            name: Notification.Name(Constants.QUOTES_UPDATE_NOTIFICATION),
            object: nil)
        quotes = quoteRepository.getQuotes()
        searchBar.delegate = self
        filteredQuotes = quotes
        quoteProvider.fetchQuotes()

    }
    
    
    @IBAction func refreshControlValueChanged(_ sender: UIRefreshControl) {
        quoteProvider.fetchQuotes()
        print("refresh")
        sender.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            // Add animations here
        
        let animation = AnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 1.0, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)


   }
    
    @objc func updateQuotes(notification: Notification) {
        if let quotes = notification.object as? [Quote] {
            self.quotes = quotes
            self.filteredQuotes = quotes
            quoteCached.clearQuoteCashed()
            quoteCached.saveQuoteCaсhed(with: quotes)
            tableView.reloadData()
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        playSound()
        if selectQuoteMode != nil {
            return
        }
          if segue.identifier == "ShowDetail",
            let cell = sender as? QuoteCell,
            let detailVC = segue.destination as? QuoteDetailViewController,
            let indexPath = tableView.indexPath(for: cell) {
            detailVC.quote = filteredQuotes[indexPath.row]
        }
    }
    
    func playSound()  {
        do {
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "ClickCell", ofType: "wav")!)
            clickCell = try AVAudioPlayer(contentsOf: url)
           // clickCell.prepareToPlay()
            clickCell.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ShowDetail" && selectQuoteMode != nil {
            return false
        }
        return true
    }
    
   //  This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredQuotes = searchText.isEmpty ? quotes : quotes.filter { (item: Quote) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }

        tableView.reloadData()
    }
}


extension QuoteTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuotes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           guard let unwrappedSelectQuoteMode = selectQuoteMode else {
               return
           }
         
         self.navigationController?.popToRootViewController(animated: true)
           let quote = filteredQuotes[indexPath.row]

           NotificationCenter.default.post(
               name: NSNotification.Name(rawValue: "quoteToConverter"),
               object: quote,
               userInfo: ["selectQuoteMode" : unwrappedSelectQuoteMode])

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCellId", for: indexPath) as? QuoteCell {
            
           let quote = filteredQuotes[indexPath.row]
            let rank = indexPath.row+1
            cell.configure(with: quote, rank: rank)  
            return cell
            
        }
        
        return UITableViewCell()
    }
}

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}

//extension QuoteTableViewController: TimerUpdaterDelegate {
//    func updateTimer() {
//        quoteProvider.getQuotes { quotes in self.quotes = quotes }
//    }
//}
