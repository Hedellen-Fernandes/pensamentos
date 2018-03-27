//
//  QuotesMenager.swift
//  Pensamentos
//
//  Created by Hedellen Fernandes on 06/03/2018.
//  Copyright © 2018 Hedellen Fernandes. All rights reserved.
//

import Foundation

 
class QuotesMenager {

    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
        
    }
    
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
}
