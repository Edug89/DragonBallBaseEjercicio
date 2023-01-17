//
//  HeroesListTableViewController.swift
//  DragonBallBase
//
//  Created by Eduardo Martinez Palomino on 16/1/23.
//

import Foundation
import UIKit

class HeroesListTableViewController: UIViewController {
    
    var mainView: HeroesListView { self.view as! HeroesListView } // convertimos la vista de la clase tableView a HeroesList View
    var heroes: [HeroModel] = []
    var tableViewDataSource: HeroesListTableViewDataSource?
    var viewModel: HeroListViewModel?
    
    override func loadView() {
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView) //Aquí creamos
        mainView.heroesTableView.dataSource = tableViewDataSource //Aquí lo enlazamos
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HeroListViewModel()
        
        // Preparándome para recibir los datos que viene del viewModel
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
        
        //Call api to get hero list
        viewModel?.fetchData()
    }
    
//    func fetchData() {
//  Primero definimos el enlace del token,luego hacemos la llamada a dicho token y luego nos traemos una lista de heroes o por lo contrario un error.
    
//        let myToken = "eyJ0eXAiOiJKV1QiLCJraWQiOiJwcml2YXRlIiwiYWxnIjoiSFMyNTYifQ.eyJlbWFpbCI6ImVkdWdwcm9kdWNlQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwLCJpZGVudGlmeSI6IkQzMzg3RjlDLTJGMTQtNDlEQi1BNkQ3LThEODY2RjEzQ0JFQiJ9.4MyBIZ67VVzmZGCTNiNI55QsN9L-ph2VUx44vzVHymQ"
//        
//        let apiClient = ApiClient(token: myToken)
//        apiClient.getHeroes { [weak self] heroes, error in
//            self?.heroes = heroes
//            self?.tableViewDataSource?.heroes = heroes
//        }
//    }
    
}
