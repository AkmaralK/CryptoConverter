//
//  ViewController.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/9/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//
import AVFoundation
import UIKit

final class ConverterViewController: UIViewController {
    
    @IBOutlet private var outputLabel1: UILabel!
    @IBOutlet weak var outputLabel2: UILabel!
    @IBOutlet private var selectQuoteLabel1: UILabel!
    @IBOutlet private var selectQuoteLabel2: UILabel!
    
    @IBOutlet private var resultLable: UILabel!
    
    private var quotes = [Quote]()
    private var quote1: Quote?
    private var quote2: Quote?
    var clickOnSelectQuote = AVAudioPlayer()
    
    @IBAction func select1UIButton(_ sender: Any) {
        do {
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "ClickOnSelectQuote", ofType: "wav")!)
            clickOnSelectQuote = try AVAudioPlayer(contentsOf: url)
          //  clickOnSelectQuote.prepareToPlay()
            clickOnSelectQuote.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    @IBAction func select2UIButton(_ sender: Any) {
        do {
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "ClickOnSelectQuote", ofType: "wav")!)
            clickOnSelectQuote = try AVAudioPlayer(contentsOf: url)
          //  clickOnSelectQuote.prepareToPlay()
            clickOnSelectQuote.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    


     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quotesController = segue.destination as? QuoteTableViewController {
                 if segue.identifier == "selectFromQuote" {
                       quotesController.selectQuoteMode = 1
                      } else if segue.identifier == "selectToQuote" {
                             quotesController.selectQuoteMode = 2
                }
        }
}
    
    override func viewDidLoad() {
           super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(selectQuote),
            name: Notification.Name(rawValue: "quoteToConverter"),
            object: nil)
    }
    @objc func selectQuote(notification: Notification) {
           if let quote = notification.object as? Quote {
            guard let mode = notification.userInfo?["selectQuoteMode"] as? Int else { return }
                if mode == 1 {
                   self.quote1 = quote
                    selectQuoteLabel1.text = String(self.quote1!.name)
                    outputLabel2.text = String(self.quote1!.price)
                } else {
                    self.quote2 = quote
                    selectQuoteLabel2.text = String(self.quote2!.name)
                    let converter = Converter(baseQuote: quote2!) 
                    let convertedQuote = converter.convert(amount: 1, convertQuote: quote1!)
                    outputLabel1.text = String(convertedQuote)
                    resultLable.text = String("1 \(String((self.quote1?.id)!)) = \(convertedQuote) \(String((self.quote2?.id)!))")
                }
           }
       }
    
}
