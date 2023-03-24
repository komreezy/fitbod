//
//  ExerciseHistoryView.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

struct ExerciseHistoryView: View {
    @ObservedObject var viewModel: ExerciseHistoryViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.histories, id: \.id) { history in
                        NavigationLink(destination: ExerciseDetailView(viewModel: ExerciseDetailViewModel(history: history))) {
                            ExerciseHistoryCell(history: history)
                        }
                        .foregroundColor(.text)
                    }
                }
                .padding(.top, 12)
                .padding()
            }
            .navigationTitle("One Rep Max")
        }
    }
}
