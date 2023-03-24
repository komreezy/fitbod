//
//  ExerciseDetailView.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/15/23.
//

import Charts
import SwiftUI

struct ExerciseDetailView: View {
    @EnvironmentObject var settings: ProfileSettings
    @ObservedObject var viewModel: ExerciseDetailViewModel
    
    /// calculated variable to convert between lb and kg
    private var oneRepMax: Int {
        settings.unit.currentValue(viewModel.history.averageOneRepMax)
    }
    
    var upperBound: Int {
        settings.unit.currentValue(viewModel.history.upperBound)
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.history.name)
                        .font(.system(.title2, weight: .bold))
                    Text("One Rep Max : \(settings.unit.stringValue)")
                        .font(.system(.subheadline))
                }
                
                Spacer()
                
                Text("\(oneRepMax)")
                    .font(.system(.title, weight: .semibold))
            }
            
            VStack(alignment: .leading) {
                Chart {
                    RuleMark(y: .value("Average", oneRepMax))
                        .foregroundStyle(Color.teal)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    
                    ForEach(viewModel.history.workouts) { workout in
                        LineMark(
                            x: .value("Day", workout.date, unit: .day),
                            y: .value("Weight", settings.unit.currentValue(workout.averageOneRepMax))
                        )
                        .foregroundStyle(.primary)
                        .symbol(Circle())
                    }
                }
                .frame(height: 200)
                .chartYScale(domain: 0...upperBound)
                .chartXAxis {
                    AxisMarks(preset: .aligned, values: viewModel.dates) { date in
                        AxisValueLabel(format: viewModel.formatStyle)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}
