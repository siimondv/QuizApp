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
    private var questionDetails: [QuestionDetails] = []
    private var currentQuestionIndex = -1
    @Published private(set) var correctAnswers = 0
    @Published private(set) var progressCount = 0
    @Published private(set) var reachedEndOfQuiz = false
    @Published private(set) var currenQuestionDetails: QuestionDetails = .empty
    @Published private(set) var allAnswersFromCurrentQuestion: [Answer] = []

    
    init() {
        fetchQuestions()
    }
    
    func fetchQuestions() {
        guard let request = Request.weatherInfoRequest else { return }
        
        Service.shared.execute(request, expecting: GetQuestionDetailsResponse.self) { [weak self] result in
                
            switch (result){
                    
            case .success(let response):
                self?.questionDetails = response.results
                self?.getNextQuestion()
                    
            case .failure(let error):
                print("Failed to fetch organization: \(error)")
                    
            }
                
        }
        

    }
    
    func getNextQuestion(){
        DispatchQueue.main.async {
                self.currentQuestionIndex += 1
                self.progressCount += 1

                if (self.currentQuestionIndex + 1) >= self.totalQuesitons {
                    self.reachedEndOfQuiz = true
                    return
                }

                self.currenQuestionDetails = self.questionDetails[self.currentQuestionIndex]

                self.allAnswersFromCurrentQuestion = (self.currenQuestionDetails.incorrectAnswers + [self.currenQuestionDetails.correctAnswer]).shuffled().map { answer in
                    Answer(answer: answer, isCorrect: answer == self.currenQuestionDetails.correctAnswer)
                }
            }
        
    }
    
    func selectedCorrectAnswer(){
        DispatchQueue.main.async {
            self.correctAnswers += 1
        }
    }
    
}
