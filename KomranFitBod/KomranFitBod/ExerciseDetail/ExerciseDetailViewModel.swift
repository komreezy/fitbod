//
//  ExerciseDetailViewModel.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

class ExerciseDetailViewModel: ObservableObject {
    @Published var history: ExerciseHistory
    
    /// can be exanded way more to provide more insightful labels for the date range
    lazy var formatStyle: Date.FormatStyle = {
        let allDates = history.workouts.compactMap({ $0.date })
        guard let first = allDates.first, let last = allDates.last else { return .dateTime.month() }
        let days = Calendar.current.numberOfDaysBetween(first: first, and: last)
        
        if days < 60 {
            return .dateTime.day()
        } else {
            return .dateTime.month()
        }
    }()
    
    /// grab an even distribution to provide custom xAxis labels
    lazy var dates: [Date] = {
        var results: [Date] = []
        let allDates = history.workouts.compactMap({ $0.date })
        
        // first & last
        guard let first = allDates.first, let last = allDates.last else { return [] }
        
        // middle
        let midDays = Calendar.current.numberOfDaysBetween(first: first, and: last)
        let mid = Calendar.current.date(daysBefore: midDays / 2, date: last)
        
        // second
        let secondDays = Calendar.current.numberOfDaysBetween(first: first, and: mid)
        let second = Calendar.current.date(daysBefore: secondDays / 2, date: mid)
        
        // fourth
        let fourthDays = Calendar.current.numberOfDaysBetween(first: mid, and: last)
        let fourth = Calendar.current.date(daysBefore: fourthDays / 2, date: last)
        
        results.append(first)
        results.append(second)
        results.append(mid)
        results.append(fourth)
        results.append(last)
        
        return results
    }()
    
    init(history: ExerciseHistory) {
        self.history = history
    }
}
