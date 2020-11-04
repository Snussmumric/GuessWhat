//
//  RecordCaretaker.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 01.11.2020.
//

import Foundation

class RecordCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "results"
    
    func saveGame(record: [Record]) {
        do {
            let data = try encoder.encode(record)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecord() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }

        do {
            return try decoder.decode([Record].self, from: data)
        }
        catch {
            print(error.localizedDescription)
            return []
        }
    }
}
