//
//  FlashMathApp.swift
//  FlashMath
//
//  Created by Philipp on 18.11.2023.
//

import SwiftUI

@main
struct FlashMathApp: App {
    @State private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environment(viewModel)
        }
    }
}
