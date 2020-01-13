//
//  UserSettings.swift
//  Userdefaults
//
//  Created by Tsering Lama on 1/13/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation

enum UnitMeasurement: String {
    case miles = "Miles"
    case km = "Km"
}

struct userKey {
    static let unitMeasurement = "Unit Measurement"
}

class userPreference {
    private init() {}
    private let standard = UserDefaults.standard // is a singleton
    static let shared = userPreference()
    
    func updateUnitMeasurement(unit: UnitMeasurement) {
        // storing user defaults
        // key is "User Measurement" with value either being "miles" or "km"
        // ["User Measurement" : "Miles"]
        standard.set(unit.rawValue, forKey: userKey.unitMeasurement) // UserDefaults.standard.set
    }
    
    func getMeasurement() -> UnitMeasurement? {
        guard let unitMeasurement = standard.object(forKey: userKey.unitMeasurement) as? String else {
            return nil
        }
        return UnitMeasurement(rawValue: unitMeasurement)
    }
}
