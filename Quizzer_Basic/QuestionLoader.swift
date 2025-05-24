//
//  QuestionLoader.swift
//  Quizzer
//
//  Created by Osman Baş on 24.05.2025.
//

import Foundation

class QuestionLoader {
    static func loadQuestions() -> [Question] {
        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let questions = try? JSONDecoder().decode([Question].self, from: data) else {
            print("Sorular yüklenemedi.")
            return []
        }
        return questions
    }
}
