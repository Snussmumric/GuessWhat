//
//  GameSession.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 01.11.2020.
//

import Foundation

final class GameSession: Codable {
    
    private var score: Int
    private var date: Date
    
    init(score: Int, date: Date) {
        self.score = score
        self.date = date
    }
    
}
