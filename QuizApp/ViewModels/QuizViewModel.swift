//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Simon Delgado on 12/1/25.
//

import Foundation

final class QuizViewModel : ObservableObject
{
    let totalQuesitons = 10
    @Published private(set) var currentQuestionIndex = -1
    @Published private(set) var correctAnswers = 0
    @Published private(set) var reachedEndOfQuiz = false
    @Published private(set) var questionDetails: [QuestionDetails] = []
    @Published private(set) var currenQuestionDetails: QuestionDetails = .empty
    @Published private(set) var allAnswersFromCurrentQuestion: [String] = []
    @Published private(set) var isAnswerFromCurrentQuestionCorrect: Bool = false

    
    func fetchQuestions()
    {
        guard let request = Request.weatherInfoRequest else { return }
        
        Service.shared.execute(request, expecting: GetQuestionDetailsResponse.self) { [weak self] result in
            
            switch (result){
                
            case .success(let response):
                self?.questionDetails = response.results
                
            case .failure(let error):
                print("Failed to fetch organization: \(error)")
                
            }
            
        }
        
    }
    
    func getNextQuestion(){
        currentQuestionIndex += 1
        
        if currentQuestionIndex >= totalQuesitons {
            reachedEndOfQuiz = true
            return
        }
        
        currenQuestionDetails = questionDetails[currentQuestionIndex]
        allAnswersFromCurrentQuestion = (currenQuestionDetails.incorrectAnswers + [currenQuestionDetails.correctAnswer]).shuffled()
        isAnswerFromCurrentQuestionCorrect = false
    }
    
    func checkAnswer(_ answer: String){
        isAnswerFromCurrentQuestionCorrect = answer == currenQuestionDetails.correctAnswer
    }
    
}
