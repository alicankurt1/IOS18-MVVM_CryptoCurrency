//
//  CryptoCurrencyModel.swift
//  MVVM_CryptoCurrency
//
//  Created by Alican Kurt on 25.09.2021.
//

import Foundation


struct CryptoCurrencyModel : Decodable{
    // Decodable : If you want to get data from Internet(Example: JSON File), decodable can Decode the data automatically
    // The names in JSON File and These variables' name must be SAME.
    let currency : String
    let price : String
}
