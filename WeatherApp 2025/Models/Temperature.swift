//
//  Temperature.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

struct Temperature: Codable {
    var min: Double
    var max: Double
    
    init(min: Double, max: Double) {
        self.min = min
        self.max = max
    }
}
