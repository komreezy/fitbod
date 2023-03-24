//
//  ExerciseHistory.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

struct ExerciseHistory: Codable, Identifiable {
    var id = UUID()
    let name: String
    let sets: [ExerciseSet]
    let workouts: [Workout]
    let averageOneRepMax: Int
    let upperBound: Int
    
    init(name: String, sets: [ExerciseSet], workouts: [Workout]) {
        self.name = name
        self.sets = sets
        self.workouts = workouts
        self.averageOneRepMax = sets.reduce(0, { $0 + $1.oneRepMax }) / sets.count
        self.upperBound = (workouts.max(by: { $0.averageOneRepMax < $1.averageOneRepMax })?.averageOneRepMax ?? 200) + 200
    }
}

struct ExerciseHistoryFactory {
    let exercises: [ExerciseSet]
    
    func histories() -> [ExerciseHistory] {
        var histories: [String: [ExerciseSet]] = [:]
        
        exercises.forEach { exercise in
            if let exercises = histories[exercise.name] {
                histories[exercise.name] = exercises + [exercise]
            } else {
                histories[exercise.name] = [exercise]
            }
        }

        return histories.compactMap { ExerciseHistory(name: $0, sets: $1, workouts: self.workouts(for: $1)) }
    }
    
    /// Workouts are a group of ExerciseSets on the same day
    /// Sorting these wourkouts by those days
    private func workouts(for exercises: [ExerciseSet]) -> [Workout] {
        var maxes: [String: [ExerciseSet]] = [:]
        exercises.forEach { exercise in
            if let existingMaxes = maxes["\(exercise.date)"] {
                maxes["\(exercise.date)"] = existingMaxes + [exercise]
            } else {
                maxes["\(exercise.date)"] = [exercise]
            }
        }
        
        return maxes.compactMap { Workout(date: $0, sets: $1) }.sorted(by: { $0.date < $1.date })
    }
}
