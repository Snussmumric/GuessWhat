//
//  GameService.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import Foundation
import SwiftyJSON

final class GameService {
    
    
        func get (completion: @escaping ([Questions]) -> Void) {
    
            guard let path = Bundle.main.path(forResource: "Base", ofType: "json") else {return}
            let url = URL(fileURLWithPath: path)
    
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                var items: [Questions] = []
                if let data = data, let json = try? JSON(data: data) {
                    items = json["questions"].arrayValue.map {Questions(json: $0)}
                }
                DispatchQueue.main.async {
                    completion(items)
                }
            }.resume()
        }
    

}
