//
//  QuizControllerView.swift
//  QuizApp
//
//  Created by Simon Delgado on 12/1/25.
//

import SwiftUI


struct QuizControllerView : View {
    
    @EnvironmentObject var quizViewModel: QuizViewModel
    
    var body: some View {
        if(!quizViewModel.reachedEndOfQuiz){
            QuizQuestionView().environmentObject(quizViewModel)
        }
        else{
            QuizResultView().environmentObject(quizViewModel)
        }
    }
}
