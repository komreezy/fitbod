//
//  WeightUnit.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

enum WeightUnit: Int {
    case lbs
    case kg
}

extension WeightUnit {
    var stringValue: String {
        switch self {
        case .lbs: return "lbs"
        case .kg: return "kg"
        }
    }
    
    /// this whole unit measurement transfer could be done better
    func currentValue(_ pounds: Int) -> Int {
        switch self {
        case .lbs: return pounds
        case .kg: return pounds.kgValue()
        }
    }
}

extension Int {
    func kgValue() -> Int {
        let lbs = Measurement(value: Double(self), unit: UnitMass.pounds)
        return Int(lbs.converted(to: .kilograms).value)
    }
}
