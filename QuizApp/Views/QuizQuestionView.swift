//
//  QuizQuestionView.swift
//  QuizApp
//
//  Created by Simon Delgado on 11/1/25.
//

import SwiftUI

struct QuizQuestionView: View {
    
    @EnvironmentObject var quizViewModel: QuizViewModel
        
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
                    ProgressView(value: Double(quizViewModel.progressCount), total: Double(quizViewModel.totalQuesitons))
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                    Text("\(quizViewModel.progressCount)/\(quizViewModel.totalQuesitons)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                }
                
                Text(quizViewModel.currenQuestionDetails.question)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                
                VStack(spacing: 15) {
                    ForEach(quizViewModel.allAnswersFromCurrentQuestion, id: \.self) { answer in
                        AnswerBox(answer: answer){ isCorrect in
                            if isCorrect {
                                quizViewModel.selectedCorrectAnswer()
                            }
                            
                        }
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                Button(action: {
                                    quizViewModel.getNextQuestion()
                                }) {
                                    Text("Next Question")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.orange)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.customYellow)
                                        .cornerRadius(15)
                                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
                                }
                                
                
                
            }
            .padding()
            .navigationTitle("Quiz")
        }
    }
}

struct AnswerBox: View {
    @State private var isSelected: Bool = false
    var answer: Answer
    var onSelect: (Bool) -> Void
    
    var body: some View {
        Text(answer.answer)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.9))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        isSelected ? (answer.isCorrect ? Color.green : Color.red) : Color.orange.opacity(0.8),
                        lineWidth: isSelected ? 4 : 2
                    )
            )
            .font(.headline)
            .foregroundColor(Color.orange)
            .onTapGesture {
                if !isSelected {
                    isSelected = true
                    onSelect(answer.isCorrect)
                }
            }
    }
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView()
    }
}
