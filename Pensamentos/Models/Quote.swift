//
//  Quote.swift
//  Pensamentos
//
//  Created by Hedellen Fernandes on 06/03/2018.
//  Copyright © 2018 Hedellen Fernandes. All rights reserved.
//

import Foundation


struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String

    var quoteFormatted: String {
        return " ‟" + quote + "〞"
    }
    
    var authorFormatted: String {
        return "- " + quote + " -"
    }
    
}
