//
//  QuizResultView.swift
//  QuizApp
//
//  Created by Simon Delgado on 11/1/25.
//

import SwiftUI

struct QuizResultView: View {
    @State private var totalQuestions = 10
    @State private var correctAnswers = 8
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("🎉 Congratulations! 🎉")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 10) {
                    Text("You Finished the Quiz!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Your Score:")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.9))
                    
                    Text("\(correctAnswers) / \(totalQuestions)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                
                Text("Keep going and aim even higher next time! 🚀")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button(action: {
                }) {
                    Text("Restart Quiz")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
    }
}
