//
//  QuestionListView.swift
//  Quizzer
//
//  Created by Osman Baş on 24.05.2025.
//


// DEBUG: JSON'dan gelen soruları test etmek için kullanıldı


import SwiftUI

struct QuestionListView: View {
    let questions = QuestionLoader.loadQuestions()

    var body: some View {
        NavigationView {
            List(questions) { question in
                VStack(alignment: .leading, spacing: 8) {
                    Text(question.question)
                        .font(.headline)
                    ForEach(question.options.indices, id: \.self) { index in
                        Text("- \(question.options[index])")
                            .font(.subheadline)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Tüm Sorular")
        }
    }
}


#Preview {
    QuestionListView()
}
