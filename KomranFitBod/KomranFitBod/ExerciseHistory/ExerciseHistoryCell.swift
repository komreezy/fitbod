//
//  ExerciseHistoryCell.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

struct ExerciseHistoryCell: View {
    @EnvironmentObject var settings: ProfileSettings
    let history: ExerciseHistory
    
    /// calculated variable to convert between lb and kg
    private var oneRepMax: String {
        "\(settings.unit.currentValue(history.averageOneRepMax))"
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(history.name)
                        .font(.system(.title2, weight: .bold))
                    Text("One Rep Max : \(settings.unit.stringValue)")
                        .font(.system(.subheadline))
                }
                
                Spacer()
                
                Text(oneRepMax)
                    .font(.system(.title, weight: .semibold))
            }
            
            Divider()
        }
        .padding(4)
    }
}
