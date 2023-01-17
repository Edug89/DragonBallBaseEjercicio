//
//  HeroesListTableViewDataSource.swift
//  DragonBallBase
//
//  Created by Eduardo Martinez Palomino on 16/1/23.
//

import Foundation
import UIKit

class HeroesListTableViewDataSource: NSObject, UITableViewDataSource {
    
    let tableView: UITableView
    
//    var heroes: [HeroModel] = []
    
    var heroes: [HeroModel] = [] { //Definimos una variable, con el sistema de notificación didSet cuando se modifique debe ejecutar el código de abajo del didSet.
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, heroes: [HeroModel] = []) {
        self.heroes = heroes
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesListViewCell", for: indexPath) as! HeroListViewCell
        
        let heroe = heroes[indexPath.row]
        
        cell.configure(heroe)
//        cell.textLabel?.text = heroe.name
        
        return cell
    }
    
}
