//
//  CoinModelController .swift
//  CoinBrowser
//
//  Created by Briana Bayne on 6/12/23.
//

import Foundation

class CoinModelController {
    
    
    // MARK: - Properties
    // Main URL
    private static let urlString = "https://api.coingecko.com/api/v3"
    
    // component keys / k = key
    private static let kCoins = "coins"
    private static let kList = "list"
    
    
    static var coins: [Coin] = []
    
    
    // MARK: - Functions - Create,Read,Update,Delete
    
    // Not creating any data, the user is requesting the data from the API, this could be any type of data
    
    static func fetchCoins(completion: @escaping (Bool) -> Void) {
        guard let baseURL = URL(string: urlString) else { return completion(false) }
        
        
        // step 1 build and complete URL
        let coinsURL = baseURL.appendingPathComponent(kCoins)
        let finalURl = coinsURL.appendingPathComponent(kList)
        print(finalURl)
        
        
        // step 2, Data task -
        
        URLSession.shared.dataTask(with: finalURl) { coinData, _, error in
            // Step 1 - handle the error
            if let error {
                print("There was an error: \(error.localizedDescription) ")
                
                completion(false)
                
                
            }
            
            // check for Data
            guard let data = coinData else {
            completion(false)
                return
            }
            
            do { // do this by trying all of this
                if let topLevelArrayOfCoinDictionaries = try
                    JSONSerialization.jsonObject(with: data, options:.allowFragments) as? [[String: String]] {
                        for coinDictionary in topLevelArrayOfCoinDictionaries {
                            if let parsedCoin = Coin(dictionary: coinDictionary) {
                                coins.append(parsedCoin) }
                        }
                    }
                
            } catch {
                print("There was an error in Do-Try-Catch: \(error.localizedDescription)")
                completion(false)
            }
            
            
            
        }.resume()
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    //read
    
}
