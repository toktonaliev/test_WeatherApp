//
//  WeatherListTVC.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate, SettingsDelegate {

    private var weatherListVM = WeatherListViewModel()
    private var datasource: TableViewDataSource<WeatherCell, Weather>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datasource = TableViewDataSource(items: self.weatherListVM.weatherItems, configureCell: { cell, weather in
            cell.cityNameLabel.text = weather.name
            cell.temperatureLabel.text = weather.currentTemperature.temperature.formatAsDegree
        })
        self.tableView.dataSource = self.datasource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        } else if segue.identifier == "WeatherDetailsViewController" {
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    }
    
    // MARK: AddWeatherDelegate
    func addWeatherDidSave(weather: Weather) {
        self.weatherListVM.addWeatherItem(weather)
        self.datasource.updateItems(self.weatherListVM.weatherItems)
        tableView.reloadData()
    }
    
    // MARK: SettingsDelegate
    func settingsDone(viewModel: SettingsViewModel) {
        self.weatherListVM.updateUnit(to: viewModel.selectedUnit)
        self.datasource.updateItems(self.weatherListVM.weatherItems)
        self.tableView.reloadData()
    }
}

// MARK: Private Methods
private extension WeatherListTableViewController {
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("UINavigationController not found!")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatheCityViewController not found!")
        }
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("UINavigationController not found!")
        }
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found!")
        }
        settingsTVC.delegate = self
    }
    
    func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController, let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("WeatherDetailsViewController not found!")
        }

        let weather = self.weatherListVM.weatherAt(indexPath.row)
        weatherDetailsVC.weather = weather
    }
}

