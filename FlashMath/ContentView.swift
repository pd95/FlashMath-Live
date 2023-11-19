//
//  ContentView.swift
//  FlashMath
//
//  Created by Philipp on 18.11.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        ZStack {
            switch viewModel.playState {
            case .menu:
                MenuView()
            case .playing:
                PlayingView()
            case .gameOver:
                GameOverView()
            }
        }
        .backgroundGradient()
        .animation(.spring, value: viewModel.playState)
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
        .environment(\.colorScheme, .dark)
}
