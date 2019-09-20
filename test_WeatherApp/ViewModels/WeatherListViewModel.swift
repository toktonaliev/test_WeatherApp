//
//  WeatherListVM.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private(set) var weatherItems = [Weather]()
    
    mutating func addWeatherItem(_ weather: Weather) {
        self.weatherItems.append(weather)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherItems.count
    }
    
    func weatherAt(_ index: Int) -> Weather {
        return self.weatherItems[index]
    }
    
    mutating func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private mutating func toCelsius() {
        weatherItems = weatherItems.map { item in
            var weather = item
            weather.currentTemperature.temperature = (weather.currentTemperature.temperature - 32) * 5/9
            return weather
        }
    }
    
    private mutating func toFahrenheit() {
        weatherItems = weatherItems.map { item in
            var weather = item
            weather.currentTemperature.temperature = (weather.currentTemperature.temperature * 9/5) + 32
            return weather
        }
    }
}
