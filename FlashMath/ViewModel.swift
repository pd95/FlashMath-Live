//
//  ViewModel.swift
//  FlashMath
//
//  Created by Philipp on 18.11.2023.
//

import Foundation

@Observable
@dynamicMemberLookup
class ViewModel {
    enum PlayState {
        case menu, playing, gameOver, settings
    }


    private(set) var playState = PlayState.menu

    var questionNumber = 0
    var question: Question!
    var level = ExperienceLevel.moderate
    var timeAllowed = 20.0

    let allQuestions: [any Question.Type] = [
        MultipleQuestion.self,
        HowManyMultiplesQuestion.self,
        HighestLowestQuestion.self,
        OperationQuestion.self
    ]

    subscript<Value>(dynamicMember keyPath: KeyPath<Question, Value>) -> Value {
        question[keyPath: keyPath]
    }

    init() {
        let storedLevel = UserDefaults.standard.integer(forKey: "ExperienceLevel")
        level = ExperienceLevel(rawValue: storedLevel) ?? .moderate
        nextQuestion()
        timeAllowed = level.timeAllowed
    }

    func nextQuestion() {
        question = allQuestions.randomElement()!.init()
        questionNumber += 1
        timeAllowed *= 0.99
    }

    func check(answer: Int) {
        if answer == question.correctAnswer {
            nextQuestion()
        } else {
            gameOver()
        }
    }

    func gameOver() {
        playState = .gameOver
        UserDefaults.standard.set(questionNumber - 1, forKey: "LastScore")
    }

    func start() {
        playState = .playing
        timeAllowed = level.timeAllowed
        questionNumber = 0
        nextQuestion()
    }

    func end() {
        playState = .menu
    }

    func settings() {
        playState = .settings
    }

    func setLevel(_ newLevel: ExperienceLevel) {
        level = newLevel
        UserDefaults.standard.set(level.rawValue, forKey: "ExperienceLevel")
        timeAllowed = level.timeAllowed
        playState = .menu
    }
}
