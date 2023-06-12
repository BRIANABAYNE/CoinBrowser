//
//  Coin.swift
//  CoinBrowser
//
//  Created by Briana Bayne on 6/12/23.
//

import Foundation

class Coin {
    
    let id: String
    let symbol : String
    let name: String
    
    // init = creating - Fail-able init - add a ? // using this becasue we are getting it from the internet
    init?(dictionary: [String:String] ) {
        // We need to unwrap the optionals
     guard let id = dictionary["id"], // Subscript syntax
        let symbol = dictionary["symbol"],
                let name = dictionary["name"] else { return nil }
        
        self.id = id
        self.symbol = symbol
        self.name = name
        
    }
    
}
