//
//  WeatherCell.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ weather: Weather) {
        self.cityNameLabel.text = weather.name
        self.temperatureLabel.text = "\(weather.currentTemperature.temperature.formatAsDegree)"
    }
}
