//
//  Question.swift
//  FlashMath
//
//  Created by Philipp on 18.11.2023.
//

import Foundation

protocol Question {
    var questionText: String { get set }
    var correctAnswer: Int { get set }
    var allAnswers: [Int] { get set }

    init()
}
