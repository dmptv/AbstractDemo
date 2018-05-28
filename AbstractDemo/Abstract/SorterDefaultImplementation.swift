//
//  SorterDefaultImplementation.swift
//  AbstractDemo
//
//  Created by Ihor Malovanyi on 28.05.2018.
//  Copyright © 2018 Ihor Malovanyi. All rights reserved.
//

import Foundation

typealias AbstractSorterCondition = (AbstractItem, AbstractItem) -> Bool

class SorterDefaultImplementation: AbstractSorter {
    
    private var condition: AbstractSorterCondition
    
    //Init with specific sorter condition
    init(_ condition: @escaping AbstractSorterCondition) {
        self.condition = condition
    }
    
    func performSorter(_ items: [AbstractItem]?) -> [AbstractItem]? {
        guard let items = items else { return nil }
        
        return items.sorted(by: condition)
    }
    
}
