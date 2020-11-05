//
//  MenuController.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import UIKit

class MenuController: UIViewController {
    
    @IBOutlet weak var lastResultLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var shuffledSwitch: UISwitch!
    @IBOutlet weak var addQuestionButton: UIButton!
    lazy var game = Game.shared
    
    private var selectedShuffled: Shuffled {
        switch self.shuffledSwitch.isOn {
        case true:
            return .shuffled
        case false:
            return .normal
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GameController {
            controller.gameDelegate = self
            controller.shuffled = self.selectedShuffled
            game.shuffledState = self.selectedShuffled
        }
    }
}

extension MenuController: GameSceneDelegate {
    func didEndGame(with score: Int) {
        lastResultLabel.text = "\(score)"
        Game.shared.gameSession = GameSession(score: score, date: Date())
    }
}
