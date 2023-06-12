//
//  CoinListTableViewController.swift
//  CoinBrowser
//
//  Created by Briana Bayne on 6/12/23.
//

import UIKit

class CoinListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoinModelController.fetchCoins { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoinModelController.coins.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath)
        let coin = CoinModelController.coins[indexPath.row]
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.text = coin.name
        cellConfiguration.secondaryText = "symbol: \(coin.symbol), id: \(coin.id)"
        cell.contentConfiguration = cellConfiguration
        
        return cell
    }
    
}




