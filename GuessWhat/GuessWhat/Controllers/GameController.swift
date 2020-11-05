//
//  GameController.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import UIKit

protocol GameSceneDelegate: class {
    func didEndGame(with score: Int)
}

class GameController: UIViewController {
    
    weak var gameDelegate: GameSceneDelegate?
    
    var questions: [Questions] = []
    
    
    lazy var service = GameService()
    var game = Game.shared
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var anwerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var answerPercentLabel: UILabel!
    
    var userAnswer = ""
    var id = 0
    
    var shuffled: Shuffled = .normal
    var answerPercent = Observable<Double>(0.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.get() { [weak self] (questions: [Questions]) in
            guard let self = self else {return}
            
            self.questions = questions
            
            self.questions += self.game.userQuestions
            
            if self.shuffled == .shuffled {
                print(self.shuffled)
            self.questions = questions.shuffled()
            }
            
            DispatchQueue.main.async {
                self.showQuestion(id: self.id)
            }
        }
        
        self.answerPercent.addObserver(self, options: [.new, .initial]) { (answerPercent, _) in
            self.answerPercentLabel.text = "Процент правильных ответов: \(answerPercent)"
        }
    }
    
    
    func showQuestion(id: Int) {
        answerPercent.value = Double(id) / Double(questions.count)
        questionText.text = self.questions[id].text
        answerTwo.setTitle(self.questions[id].answer2, for: .normal)
        anwerOne.setTitle(self.questions[id].answer1, for: .normal)
        answerThree.setTitle(self.questions[id].answer3, for: .normal)
        answerFour.setTitle(self.questions[id].answer4, for: .normal)
    }
    
    func checkAnswer(answer: String) {
        if questions[id].correct == answer {
            id += 1
            
            if id < questions.count {
                showQuestion(id: id)
            }
            else { questionText.text = "Win!"
                self.gameDelegate?.didEndGame(with: id)
                let record = Record(date: Date(), score: id)
                Game.shared.addRecord(record: record)
                endGameAlert(title: "You WIN!", message: "Answered all \(questions.count) questions")
            }
        }
        else {
            self.gameDelegate?.didEndGame(with: id)
            let record = Record(date: Date(), score: id)
            Game.shared.addRecord(record: record)
            endGameAlert(title: "You Lose!", message: "Answered only \(id) questions from \(questions.count)")

        }
    }
    
    private func endGameAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func didPressButton(sender: UIButton){
        
        guard let userAnswer = sender.titleLabel?.text else {return}
        checkAnswer(answer: userAnswer)
        
    }
    
}
