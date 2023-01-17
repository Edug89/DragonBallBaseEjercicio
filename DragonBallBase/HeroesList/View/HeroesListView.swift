//
//  HeroesListView.swift
//  DragonBallBase
//
//  Created by Eduardo Martinez Palomino on 16/1/23.
//

import Foundation
import UIKit

class HeroesListView: UIView {
    // Create header View
    let headerLabel = {
        let label = UILabel()
        label.text = "MVC"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false //Debe ir siempreañadido a lo que queramos añadir es olbigatorio para que muestre.
        return label
    }()
    
    // Create table view
    let heroesTableView = {
        let tableView = UITableView()
//        tableView.backgroundColor =  .blue
        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HeroesListViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }() //debemos añadir los parentesis para inizializarlo, si no solo la definiriamos pero no haría laa llamada.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Create / add subviews
        setUpViews() // aquí indicamos que se enlaze las vistas que creamos
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") //Esto lo implementa Xcode, es inicializador
    }
    
    func setUpViews() {
        backgroundColor = .white
        
        addSubview(headerLabel) //Con esto añadimos,en este caso la label
        addSubview(heroesTableView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
//            heroesTableView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 50),
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
    }
}
