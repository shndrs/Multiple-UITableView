//
//  CitiesTableAnimation.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

fileprivate protocol CitiesTable {
    var parentView: UIView! { get }
    var leadingConstraint: NSLayoutConstraint! { get }
}

struct CitiesTableAnimation: CitiesTable {
    
    fileprivate var parentView:UIView!
    fileprivate var leadingConstraint:NSLayoutConstraint!
    
    init(parentView:UIView, leadingConstraint:NSLayoutConstraint) {
        self.parentView = parentView
        self.leadingConstraint = leadingConstraint
    }
    
    public func animate() {
        
        if leadingConstraint.constant == 0 {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.leadingConstraint.constant = 104
                self.parentView.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.leadingConstraint.constant = 0
                self.parentView.layoutIfNeeded()
            })
        }
    }
}
