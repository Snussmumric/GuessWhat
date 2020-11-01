//
//  GameController.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import UIKit

class GameController: UIViewController {
    
    
    var questions: [Questions] = []
    //    var question: [Questions] = []
    lazy var service = GameService()
    
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var anwerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.get() { [weak self] (questions: [Questions]) in
            guard let self = self else {return}

            self.questions = questions
            print(self.questions)

        }


        print(self.questions)
    }
    
    func loadQuestions() {
        



        
    }
    
//        func showQuestion(id: Int) {
//            questionText.text = questions[id].text
//            anwerOne.titleLabel?.text = questions[id].answer1
//            answerTwo.titleLabel?.text = questions[id].answer2
//            answerThree.titleLabel?.text = questions[id].answer3
//            answerFour.titleLabel?.text = questions[id].answer4
//
//        }
    
    
}
