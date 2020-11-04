//
//  Game.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 01.11.2020.
//

import Foundation

class Game {
    
    static let shared = Game()
    let recordCaretaker = RecordCaretaker()
    private(set) var records: [Record] {
        didSet {
            recordCaretaker.saveGame(record: records)
        }
    }

    func addRecord(record: Record) {
        records.append(record)
    }
    
    public var gameSession: GameSession? {
        didSet {
            recordCaretaker.saveGame(record: records)        }
    }

    private init() {
        records = recordCaretaker.loadRecord()
    }
    
}
