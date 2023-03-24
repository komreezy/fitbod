//
//  ProfileView.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var settings: ProfileSettings
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 20) {
                    ProfileInfoView(title: "Name", subtitle: "Fitbod")
                    
                    ProfileInfoView(title: "Email", subtitle: "supercoolreviewer@fitbod.com")
                    
                    ProfileInfoView(title: "Favorite Exercise", subtitle: viewModel.favoriteExercise)
                    
                    Divider()
                        .padding(.vertical, 12)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Unit of Measurement")
                            .font(.system(.title3, weight: .semibold))
                        
                        HStack {
                            Spacer()
                            
                            Picker("Unit", selection: $settings.unit) {
                                Text("lbs").tag(WeightUnit.lbs)
                                Text("kg").tag(WeightUnit.kg)
                            }
                            .pickerStyle(.segmented)
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileInfoView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(.title3, weight: .semibold))
                Text(subtitle)
            }
            
            Spacer()
        }
    }
}
