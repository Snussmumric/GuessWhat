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
    
    var userAnswer = ""
    var id = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.get() { [weak self] (questions: [Questions]) in
            guard let self = self else {return}
            
            self.questions = questions
            print(self.questions)
            
            DispatchQueue.main.async {
                self.showQuestion(id: self.id)
            }
        }
    }
    
    
    func showQuestion(id: Int) {
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
            }
        }
        else {
            self.gameDelegate?.didEndGame(with: id)
            let record = Record(date: Date(), score: id)
            Game.shared.addRecord(record: record)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func didPressButton(sender: UIButton){
        
        guard let userAnswer = sender.titleLabel?.text else {return}
        checkAnswer(answer: userAnswer)
        
    }
    
}
