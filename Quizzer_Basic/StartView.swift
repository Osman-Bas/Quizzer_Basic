//
//  StartView.swift
//  Quizzer
//
//  Created by Osman Baş on 23.05.2025.
//

import SwiftUI

struct StartView: View {
    @State private var lastScore: String = "-"
    @State private var showQuiz = false
    @State private var scoreHistory: [String] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Quizzer")
                    .font(.largeTitle)
                    .bold()

                Text("Son Skor: \(lastScore)")
                    .font(.title2)

                Button("Sınava Başla") {
                    showQuiz = true
                }
                .padding()
                .frame(width: 200)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Geçmiş Skorlar")
                        .font(.headline)

                    if scoreHistory.isEmpty {
                        Text("Henüz kayıt yok.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(scoreHistory.reversed(), id: \.self) { skor in
                                    Text(skor)
                                        .padding(.vertical, 4)
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .frame(height: 200)

                        Button("Geçmişi Temizle") {
                            UserDefaults.standard.removeObject(forKey: "scoreHistory")
                            scoreHistory = []
                        }
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .onAppear {
            loadScoreData()
        }
        .sheet(isPresented: $showQuiz, onDismiss: {
            loadScoreData()
        }) {
            QuizView()
        }

    }

    private func loadScoreData() {
        if let storedScore = UserDefaults.standard.string(forKey: "lastScore") {
            lastScore = storedScore
        }
        scoreHistory = UserDefaults.standard.stringArray(forKey: "scoreHistory") ?? []
    }
}

#Preview {
    StartView()
}
