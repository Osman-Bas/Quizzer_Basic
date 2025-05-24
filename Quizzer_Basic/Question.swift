//
//  Question.swift
//  Quizzer
//
//  Created by Osman Baş on 24.05.2025.
//

import Foundation

struct Question: Identifiable, Codable {
    let id: Int
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    let timeLimit: Int // saniye cinsinden
}

