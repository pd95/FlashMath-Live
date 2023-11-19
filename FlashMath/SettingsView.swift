//
//  SettingsView.swift
//  FlashMath
//
//  Created by Philipp on 19.11.2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(ViewModel.self) var viewModel

    var body: some View {
        VStack {
            Spacer()
            Text("Settings")
                .titleStyle()
            Text("Select your difficulty:")
                .subtitleStyle()
            ForEach(ExperienceLevel.allCases, id: \.self) { level in
                button(for: level)
            }
            Spacer()
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.move(edge: .bottom))
    }

    @ViewBuilder
    func button(for level: ExperienceLevel) -> some View {
        let colors: [Color] = [.green, .orange, .pink]

        Button(action: { viewModel.setLevel(level) }) {
            HStack {
                Spacer()
                Text(level.label)
                Spacer()
            }
            .overlay(
                Image(systemName: "checkmark")
                        .padding(.trailing)
                        .opacity(level == viewModel.level ? 1 : 0),
                alignment: .trailing
            )
        }
        .buttonStyle(.question(color: colors[level.rawValue]))
    }
}

#Preview {
    SettingsView()
        .backgroundGradient()
        .environment(ViewModel())
        .environment(\.colorScheme, .dark)
}
