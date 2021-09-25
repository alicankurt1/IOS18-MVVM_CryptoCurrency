//
//  ViewController.swift
//  MVVM_CryptoCurrency
//
//  Created by Alican Kurt on 25.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cryptoTableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        
        getData()
    }

    
    func getData(){
        // Get Data
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebserviceGetData().downloadCurrencies(url: url) { cryptoListFromService in
            if let cryptoListFromService = cryptoListFromService{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoListFromService)
                
                DispatchQueue.main.async {
                    self.cryptoTableView.reloadData()
                }
                
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoTableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.currencyNameLabel.text = cryptoViewModel.name
        cell.currencyPriceLabel.text = cryptoViewModel.price
                
        // Background color
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .gray
            cell.currencyNameLabel.textColor = .white
            cell.currencyPriceLabel.textColor = .white
        }else{
            cell.backgroundColor = .darkGray
            cell.currencyNameLabel.textColor = .white
            cell.currencyPriceLabel.textColor = .white
        }
        
        
        return cell
    }
    
    
    
    
}

