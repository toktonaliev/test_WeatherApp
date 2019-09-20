//
//  AddWeatherCityVC.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(weather: Weather)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text, let unit = UserDefaults.standard.value(forKey: "unit") as? String {
            
            APIService.instance.getWeatherForCity(city: city, unit: unit) { [weak self] (weather) in
                if let delegate = self?.delegate, let weather = weather {
                    delegate.addWeatherDidSave(weather: weather)
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
