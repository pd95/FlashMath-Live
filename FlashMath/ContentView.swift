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
        switch viewModel.playState {
        case .menu:
            MenuView()
        case .playing:
            PlayingView()
        case .gameOver:
            GameOverView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
