//
//  AbstractBody.swift
//  AbstractDemo
//
//  Created by Ihor Malovanyi on 28.05.2018.
//  Copyright © 2018 Ihor Malovanyi. All rights reserved.
//

import Foundation

protocol AbstractItem {}

protocol AbstractFilter {
    func performFilter(_ items: [AbstractItem]?) -> [AbstractItem]?
}

protocol AbstractSorter {
    func performSorter(_ items: [AbstractItem]?) -> [AbstractItem]?
}
