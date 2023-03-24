//
//  Calendar+Helpers.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import Foundation

extension Calendar {
    func numberOfDaysBetween(first: Date, and last: Date) -> Int {
        let numberOfDays = dateComponents([.day], from: first, to: last)
        return numberOfDays.day ?? 0 // ideally should throw error here
    }
    
    func date(daysBefore: Int, date: Date) -> Date {
        self.date(byAdding: .day, value: -daysBefore, to: date) ?? .now // ideally should throw error here
    }
}
