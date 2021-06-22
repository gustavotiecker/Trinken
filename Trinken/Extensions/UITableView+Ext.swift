//
//  UITableView+Ext.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 21/06/21.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
