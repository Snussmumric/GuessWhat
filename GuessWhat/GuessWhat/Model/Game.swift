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
    let questionCaretaker = QuestionCaretaker()
    var shuffledState: Shuffled = .normal
    
    
    private(set) var records: [Record] {
        didSet {
            recordCaretaker.saveGame(record: records)
        }
    }
    
    private(set) var userQuestions: [Questions] {
        didSet {
            questionCaretaker.saveQuestion(question: userQuestions)
        }
    }

    func addRecord(record: Record) {
        records.append(record)
    }
    
    func addQuestion(question: Questions) {
        userQuestions.append(question)
    }
    
    public var gameSession: GameSession? {
        didSet {
            recordCaretaker.saveGame(record: records)
            questionCaretaker.saveQuestion(question: userQuestions)
        }
    }
    
    

    private init() {
        records = recordCaretaker.loadRecord()
        userQuestions = questionCaretaker.loadQuestions()
    }
    
}
