//
//  UIViewController+Extension.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var storyboardID : String {
        return String(describing: self)
    }
}
