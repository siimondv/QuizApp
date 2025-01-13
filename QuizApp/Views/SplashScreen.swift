//
//  SplashScreen.swift
//  QuizApp
//
//  Created by Simon Delgado on 13/1/25.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            if self.isActive {
                QuizIntroductionView()
            } else {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

