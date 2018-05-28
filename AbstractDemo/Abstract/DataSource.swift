//
//  DataSource.swift
//  AbstractDemo
//
//  Created by Ihor Malovanyi on 28.05.2018.
//  Copyright © 2018 Ihor Malovanyi. All rights reserved.
//

import Foundation

protocol DataSourceDelegate: class {
    func dataSource(_ dataSource: DataSource, didUpdate items: [AbstractItem]?)
}

class DataSource {

    weak var delegate: DataSourceDelegate?
    
    var abstractFilter: AbstractFilter?
    var abstractSorter: AbstractSorter?
    
    var items: [AbstractItem]? {
        didSet {
            delegate?.dataSource(self, didUpdate: items)
        }
    }
    
    func addNote(_ item: AbstractItem) {

        var newItems = (items ?? [])
        newItems.append(item)
        items = newItems
        
    }
    
    func filter() {
        items = abstractFilter?.performFilter(items)
    }
    
    func sort() {
        items = abstractSorter?.performSorter(items)
    }
    
}
