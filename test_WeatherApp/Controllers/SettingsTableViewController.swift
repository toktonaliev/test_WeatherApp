//
//  SettingsTableViewController.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingsDone(viewModel: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private let cellIdentifier = "SettingsCell"
    private var settingsVM = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    @IBAction func done() {
        if let delegate = self.delegate {
            delegate.settingsDone(viewModel: self.settingsVM)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = self.settingsVM.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == self.settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingsVM.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
