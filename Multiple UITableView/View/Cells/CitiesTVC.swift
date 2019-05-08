//
//  CitiesTVC.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CitiesTVC: UITableViewCell {
    
    @IBOutlet private weak var nameLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func fill(cell by:String) {
        nameLabel.text = by
    }
    
}
