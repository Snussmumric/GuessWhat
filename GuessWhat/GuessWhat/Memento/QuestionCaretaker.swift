//
//  QuestionCaretaker.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 05.11.2020.
//

import Foundation

class QuestionCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
    func saveQuestion(question: [Questions]) {
        do {
            let data = try encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [Questions] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }

        do {
            return try decoder.decode([Questions].self, from: data)
        }
        catch {
            print(error.localizedDescription)
            return []
        }
    }
}
