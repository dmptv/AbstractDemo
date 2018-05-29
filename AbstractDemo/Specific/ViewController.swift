//
//  ViewController.swift
//  AbstractDemo
//
//  Created by Ihor Malovanyi on 28.05.2018.
//  Copyright © 2018 Ihor Malovanyi. All rights reserved.
//

import UIKit

//View Controller knows about specific data type
class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private let dataSource = DataSource()
    private var isAscending: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Abstract filter/sorter implementation with specific filter/sorter condition

        dataSource.abstractFilter = FilterDefaultImplementation {
            
            //Here we know about specific data type and can try to cast it
            guard let item = $0 as? Human else { return false }
            
            //Write specific condition to return True if it works and False if it fails
            return item.age < 10
        }
        
        dataSource.abstractSorter = SorterDefaultImplementation { (item1, item2) in
            
            //Here we know about specific data type and can try to cast it
            guard let item1 = item1 as? Human,
                let item2 = item2 as? Human else { return false }
            
            //Write specific condition to return True if it works and False if it fails
            self.isAscending = !self.isAscending
            return self.isAscending ? item1.name < item2.name : item1.name > item2.name
        }
        
        dataSource.delegate = self
    }
    
    @IBAction func addNote(_ sender: UIButton) {
        //Simulate entering the data
        let calendar = Calendar.current
        let newHuman = Human(age: calendar.component(.second, from: Date()), name: String(describing: Date()), dateOfBirth: Date())
        //Add to new data datasource
        dataSource.addNote(newHuman)
    }
    
    @IBAction func filter(_ sender: UIButton) {
        //Filter data in datasource
        dataSource.filter()
    }
    
    @IBAction func sort(_ sender: UIButton) {
        //Sort data in datasource
        dataSource.sort()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //When we work with specific views, we can use specific data, not abstract.
        if let item = dataSource.items?[indexPath.row] as? Human {
            cell.textLabel?.text = item.name
        }

        return cell
    }
    
}

extension ViewController: DataSourceDelegate {
    
    func dataSource(_ dataSource: DataSource, didUpdate items: [AbstractItem]?) {
        //Update UI after datasource did update data
        tableView.reloadData()
    }

}

