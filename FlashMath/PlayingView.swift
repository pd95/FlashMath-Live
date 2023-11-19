//
//  PlayingView.swift
//  FlashMath
//
//  Created by Philipp on 18.11.2023.
//

import SwiftUI

struct PlayingView: View {
    @Environment(ViewModel.self) var viewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()

                Button("End Game", systemImage: "xmark.circle", action: viewModel.end)
                    .labelStyle(.iconOnly)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal)

            QuestionView()
                .id(viewModel.questionNumber)
        }
    }
}

#Preview {
    PlayingView()
        .backgroundGradient()
        .environment(ViewModel())
}
