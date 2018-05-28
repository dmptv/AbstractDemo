//
//  FilterDefaultImplementation.swift
//  AbstractDemo
//
//  Created by Ihor Malovanyi on 28.05.2018.
//  Copyright © 2018 Ihor Malovanyi. All rights reserved.
//

import Foundation

typealias AbstractFilterCondition = (AbstractItem) -> Bool

class FilterDefaultImplementation: AbstractFilter {
    
    private var condition: AbstractFilterCondition
    
    //Init with specific filter condition
    init(_ condition: @escaping AbstractFilterCondition) {
        self.condition = condition
    }
    
    func performFilter(_ items: [AbstractItem]?) -> [AbstractItem]? {
        guard let items = items else { return nil }
        
        return items.filter(condition)
    }
    
}
