//
//  View+Helpers.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/23/23.
//

import SwiftUI

extension View {
    func nilAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
