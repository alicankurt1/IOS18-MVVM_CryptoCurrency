//
//  WebService_GetData.swift
//  MVVM_CryptoCurrency
//
//  Created by Alican Kurt on 25.09.2021.
//

import Foundation

class WebserviceGetData{
    // Get data and CREATING Completion Block
    func downloadCurrencies(url: URL, completion: @escaping([CryptoCurrencyModel]?) -> () ){
        
        URLSession.shared.dataTask(with: url) { data , response , error  in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                let cryptoList = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data)
                
                if let cryptoList = cryptoList{
                    completion(cryptoList)
                }
                
            }
        }.resume()
        
        
    }
    
}
