//
//  WeatherDetailsViewController.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    var weather: Weather?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
    }
    
    private func setupLabels() {
        if let weather = self.weather {
            self.cityNameLabel.text = "City: \(weather.name)"
            self.currentTempLabel.text = "Temperature: \(weather.currentTemperature.temperature.formatAsDegree)"
            self.minTempLabel.text = "Min_temp: \(weather.currentTemperature.temperatureMin.formatAsDegree)"
            self.maxTempLabel.text = "Max_temp: \(weather.currentTemperature.temperatureMax.formatAsDegree)"
        }
    }
}
