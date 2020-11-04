//
//  MenuController.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import UIKit

class MenuController: UIViewController {
    
    @IBOutlet weak var lastResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GameController {
            controller.gameDelegate = self
        }
    }
}

extension MenuController: GameSceneDelegate {
    func didEndGame(with score: Int) {
        lastResultLabel.text = "\(score)"
        Game.shared.gameSession = GameSession(score: score, date: Date())
    }
}
