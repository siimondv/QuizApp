//
//  QuizQuestionView.swift
//  QuizApp
//
//  Created by Simon Delgado on 11/1/25.
//

import SwiftUI

struct QuizQuestionView: View {
    @State private var progress = 3
    @State private var totalQuestions = 10
    @State private var questionTitle = "What is the capital of France?"
    @State private var answers = ["Paris", "Berlin", "Madrid", "Rome"]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    ProgressView(value: Double(progress), total: Double(totalQuestions))
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                    Text("\(progress)/\(totalQuestions)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                }
                
                Text(questionTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                
                VStack(spacing: 15) {
                    ForEach(answers, id: \.self) { answer in
                        AnswerBox(answer: answer)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Quiz")
        }
    }
}

struct AnswerBox: View {
    var answer: String
    
    var body: some View {
        Text(answer)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.9))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.orange.opacity(0.8), lineWidth: 2)
            )
            .font(.headline)
            .foregroundColor(Color.orange)
    }
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView()
    }
}
