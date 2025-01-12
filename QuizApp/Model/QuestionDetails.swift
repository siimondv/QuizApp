//
//  QuestionDetails.swift
//  QuizApp
//
//  Created by Simon Delgado on 12/1/25.
//

import Foundation

struct QuestionDetails: Codable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension QuestionDetails {
    static let empty = QuestionDetails(type: "", difficulty: "", category: "", question: "", correctAnswer: "", incorrectAnswers: [])
}
