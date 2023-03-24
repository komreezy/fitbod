//
//  ContentView.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = ProfileSettings()
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch viewModel.state {
            case .histories: ExerciseHistoryView(viewModel: ExerciseHistoryViewModel(histories: viewModel.histories))
            case .profile: ProfileView(viewModel: ProfileViewModel(histories: viewModel.histories))
            }
            
            TabBar(state: $viewModel.state).padding(.bottom, 18)
        }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
