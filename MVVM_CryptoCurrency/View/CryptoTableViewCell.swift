//
//  CryptoTableViewCell.swift
//  MVVM_CryptoCurrency
//
//  Created by Alican Kurt on 25.09.2021.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
