//
//  ProfileSettings.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

/// `@StateObject` to hold a user's unit preferences
class ProfileSettings: ObservableObject {
    @Published var unit: WeightUnit = .lbs
}
