//
//  ExerciseSet.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

struct ExerciseSet: Codable, Identifiable, CSVLoaded {
    var id = UUID()
    let name: String
    let date: Date
    let sets: Int
    let reps: Int
    let weight: Int
    let oneRepMax: Int
    
    // maybe can tie these to the values first
    static var attributes: [CSVAttributePair] {
        [
            ("Date of workout", Date.self),
            ("Exercise Name", String.self),
            ("Sets", Int.self),
            ("Reps", Int.self),
            ("Weight", Int.self)
        ]
    }
    
    // Assuming order: Date of workout, Exercise Name, Sets, Reps, Weight
    // can think of some way to better map the values to the attributes above
    init(array: [String] = []) {
        guard array.count == Self.attributes.count else { fatalError("malformed array") }
        var exercises = array
        
        self.date = Self.convertStringToDate(exercises.removeFirst()) ?? .distantPast
        self.name = exercises.removeFirst()
        self.sets = Int(exercises.removeFirst()) ?? 0
        self.reps = Int(exercises.removeFirst()) ?? 0
        self.weight = Int(exercises.removeFirst()) ?? 0
        self.oneRepMax = Self.oneRepMax(for: weight, and: reps)
    }
    
    private static func convertStringToDate(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter.date(from: string)
    }
    
    private static func oneRepMax(for weight: Int, and reps: Int) -> Int {
        let w = weight
        let r = reps
        
        return w * (36 / (37 - r))
    }
}
