//
//  ContentViewModel.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var state: TabBar.TabState = .histories
    @Published var histories: [ExerciseHistory]
    
    /// mock network request
    init() {
        let exercises: [ExerciseSet] = try! WorkoutDataParser().loadContent(forResource: "workoutData", withExtension: "txt", using: ",")
        self.histories = ExerciseHistoryFactory(exercises: exercises).histories()
    }
}
