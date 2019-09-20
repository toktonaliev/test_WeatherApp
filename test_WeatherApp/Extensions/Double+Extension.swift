//
//  Double+Extension.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
