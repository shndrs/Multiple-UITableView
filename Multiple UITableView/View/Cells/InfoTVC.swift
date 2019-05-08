//
//  InfoTVC.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class InfoTVC: UITableViewCell {
    
    @IBOutlet private weak var descLabel:UILabel!
    @IBOutlet private weak var populationLabel:UILabel!
    @IBOutlet private weak var langLabel:UILabel!
    @IBOutlet private weak var bannerImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func fill(cell by:InfoModel) {
        descLabel.text = by.desc
        descLabel.text = by.desc
        populationLabel.text = by.population
        langLabel.text = by.lang
        bannerImage.image = by.image
    }
}
