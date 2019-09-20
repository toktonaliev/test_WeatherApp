//
//  TableViewDataSource.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, Model>: NSObject, UITableViewDataSource
where CellType: UITableViewCell {
    
    var items: [Model]
    let configureCell: (CellType, Model) -> ()
    
    init(items: [Model], configureCell: @escaping (CellType, Model) -> ()) {
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("Cell with identifier \(CellType.identifier) not found")
        }
        
        let viewModel = self.items[indexPath.row]
        self.configureCell(cell, viewModel)
        
        return cell
    }
    
    func updateItems(_ items: [Model]) {
        self.items = items
    }
}
