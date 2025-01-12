//
//  QuizIntroductionView.swift
//  QuizApp
//
//  Created by Simon Delgado on 11/1/25.
//

import SwiftUI

struct QuizIntroductionView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Welcome to the Quiz!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Text("""
You are about to take a quiz of 10 questions. Test your knowledge and challenge yourself!
Good luck and have fun! 🎯
""")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("Start Quiz")
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
                .padding(.bottom, 50)
            }
            .padding()
        }
    }
}

struct QuizIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizIntroductionView()
    }
}
