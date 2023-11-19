//
//  ExperienceLevel.swift
//  FlashMath
//
//  Created by Philipp on 19.11.2023.
//

import Foundation

enum ExperienceLevel: Int, CaseIterable {
    case easy, moderate, difficult

    var label: String {
        switch self {
        case .easy:
            String(localized: "Easy", comment: "Label for experience level")
        case .moderate:
            String(localized: "Moderate", comment: "Label for experience level")
        case .difficult:
            String(localized: "Difficult", comment: "Label for experience level")
        }
    }

    var timeAllowed: Double {
        switch self {
        case .easy:
            30
        case .moderate:
            20
        case .difficult:
            10
        }
    }
}
