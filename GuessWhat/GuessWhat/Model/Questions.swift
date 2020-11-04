//
//  Questions.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import Foundation
import SwiftyJSON

final class Questions: Codable{
    
    var id: Int
    var text: String
    var answer1: String?
    var answer2: String
    var answer3: String
    var answer4: String
    var correct: String
    
    init(json: JSON) {
        
        self.id = json["id"].intValue
        self.text = json["text"].stringValue
        self.answer1 = json["answers"][0].stringValue
        self.answer2 = json["answers"][1].stringValue
        self.answer3 = json["answers"][2].stringValue
        self.answer4 = json["answers"][3].stringValue
        self.correct = json["correct"].stringValue
    }
    
}
