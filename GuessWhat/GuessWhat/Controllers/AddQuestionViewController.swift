//
//  AddQuestionViewController.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 04.11.2020.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    var userQuestion: [Questions] = []
    var game = Game.shared
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answer1Field: UITextField!
    @IBOutlet weak var answer2Field: UITextField!
    @IBOutlet weak var answer3Field: UITextField!
    @IBOutlet weak var answer4Field: UITextField!
    @IBOutlet weak var correctAnswerField: UITextField!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPressed (_ sender: UIButton) {
        if questionField.text == nil || answer1Field.text == nil || answer2Field.text == nil || answer3Field.text == nil || answer4Field.text == nil || correctAnswerField == nil {
            endGameAlert(title: "Something is missing", message: "One or several fields is empty!")

        } else {
            
                let userQuestion = Questions(text: questionField.text!, answer1: answer1Field.text!, answer2: answer2Field.text!, answer3: answer3Field.text!, answer4: answer4Field.text!, correct: correctAnswerField.text!)
            Game.shared.addQuestion(question: userQuestion)
            navigationController?.popViewController(animated: true)
            
        }
    }

    private func endGameAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }


}
