//
//  ExerciseHistoryViewModel.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

class ExerciseHistoryViewModel: ObservableObject {
    @Published var histories: [ExerciseHistory]
    
    init(histories: [ExerciseHistory]) {
        self.histories = histories
    }
}
