//
//  Workout.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

struct Workout: Codable, Identifiable {
    var id = UUID()
    let date: Date
    let sets: [ExerciseSet]
    let averageOneRepMax: Int
    
    init(date: String, sets: [ExerciseSet]) {
        self.date = Self.convertStringToDate(date)!
        self.sets = sets
        self.averageOneRepMax = Self.calculateAverageOneRepMax(for: sets)
    }
    
    private static func calculateAverageOneRepMax(for sets: [ExerciseSet]) -> Int {
        sets.reduce(0) { $0 + Self.oneRepMax(for: $1) } / sets.count
    }
    
    private static func oneRepMax(for set: ExerciseSet) -> Int {
        let w = set.weight
        let r = set.reps
        
        return w * (36 / (37 - r))
    }
    
    private static func convertStringToDate(_ string: String) -> Date? {
        guard let formatted = string.split(separator: " ").first?.trimmingCharacters(in: .whitespaces) else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: formatted)
    }
}
