//
//  ProfileViewModel.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var histories: [ExerciseHistory]
    @Published var favoriteExercise: String
    
    init(histories: [ExerciseHistory]) {
        self.histories = histories
        self.favoriteExercise = histories.max(by: { $0.sets.count < $1.sets.count })?.name ?? "Sleeping"
    }
}
