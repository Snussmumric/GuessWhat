//
//  ResultsController.swift
//  GuessWhat
//
//  Created by Антон Васильченко on 31.10.2020.
//

import UIKit

class ResultsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ResultsTableViewCell else { return UITableViewCell() }
        
        let record = Game.shared.records[indexPath.row]
        cell.numberLabel.text = String(indexPath.row + 1)
        cell.scoreLabel.text = String(record.score)
        cell.dateLabel.text = String(record.date.description)
        
        return cell
    }
}
