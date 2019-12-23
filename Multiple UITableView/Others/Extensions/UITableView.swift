//
//  UITableView.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/13/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func asynchronousReload() {
        
        DispatchQueue.main.async { [weak self] in
            guard let this = self else { return }
            this.reloadData()
        }
    }
}
