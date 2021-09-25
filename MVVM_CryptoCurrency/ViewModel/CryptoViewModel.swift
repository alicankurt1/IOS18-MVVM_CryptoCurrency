//
//  CryptoViewModel.swift
//  MVVM_CryptoCurrency
//
//  Created by Alican Kurt on 25.09.2021.
//

import Foundation

struct CryptoListViewModel{
    let cryptoCurrencyList : [CryptoCurrencyModel]
}

// Extension CryptoListViewModel for better code
extension CryptoListViewModel{
    func numberOfRowsInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(index: Int) -> CryptoViewModel{
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}



struct CryptoViewModel{
    let cryptoCurrency : CryptoCurrencyModel
}

// EXTENSION
extension CryptoViewModel{
    var name: String{
        return self.cryptoCurrency.currency
    }
    
    var price: String{
        return self.cryptoCurrency.price
    }
}
