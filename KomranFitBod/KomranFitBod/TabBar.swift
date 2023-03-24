//
//  TabBar.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

/// I wanted to add at least one extra thing, and I chose a Profile Screen
/// Came up with this to make switching between the main view and the profile view fun
struct TabBar: View {
    @Binding var state: TabState

    enum TabState {
        case histories
        case profile
    }
    
    private var isHistory: Bool {
        state == .histories
    }

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button(action: {
                    self.state = .histories
                }, label: {
                    HStack(spacing: 4) {
                        Image(systemName: "dumbbell.fill")
                            .multilineTextAlignment(.center)
                            .foregroundColor(isHistory ? .accentColor : .lightGrey)
                            .font(.system(size: 20))
                        Text("History")
                            .font(.custom("Bebas Neue", size: 18))
                            .foregroundColor(.accentColor)
                            .frame(width: isHistory ? 50 : 0)
                            .nilAnimation()
                    }
                    .padding(14)
                })
                .frame(height: 36)
                .background(isHistory ? Color.accentColor.opacity(0.2) : .clear)
                .cornerRadius(18)

                Spacer()

                Button(action: {
                    self.state = .profile
                }, label: {
                    HStack(spacing: 4) {
                        Image(systemName: "person.fill")
                            .multilineTextAlignment(.center)
                            .foregroundColor(!isHistory ? .accentColor : .lightGrey)
                            .font(.system(size: 20))
                            .frame(width: 17.5)
                            .nilAnimation()
                        Text("Profile")
                            .font(.custom("Bebas Neue", size: 18))
                            .foregroundColor(.accentColor)
                            .frame(width: !isHistory ? 50 : 0)
                            .nilAnimation()
                    }
                    .padding(14)
                })
                .frame(height: 36)
                .background(!isHistory ? Color.accentColor.opacity(0.2) : .clear)
                .cornerRadius(18)

                Spacer()
            }
            .frame(width: 240, height: 60)
            .frame(height: 60)
            .padding(.vertical, 4)
            .background(Color.tabBar)
            .cornerRadius(34)
            .padding(.horizontal, 40)
            .shadow(color: Color.shadow.opacity(0.2), radius: 20, x: 0, y: -2)
            .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0), value: UUID())
        }
    }
}
