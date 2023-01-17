//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by Eduardo Martinez Palomino on 16/1/23.
//

import Foundation
//En el ViewMoldel no debermiamos tener nunca UIKIT

class HeroListViewModel: NSObject {
    
    override init() {
//        super.init()
    }
    
    var updateUI: ((_ heroes: [HeroModel]) -> Void)?
    
    func fetchData() {
        
        let myToken = "eyJ0eXAiOiJKV1QiLCJraWQiOiJwcml2YXRlIiwiYWxnIjoiSFMyNTYifQ.eyJlbWFpbCI6ImVkdWdwcm9kdWNlQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwLCJpZGVudGlmeSI6IkQzMzg3RjlDLTJGMTQtNDlEQi1BNkQ3LThEODY2RjEzQ0JFQiJ9.4MyBIZ67VVzmZGCTNiNI55QsN9L-ph2VUx44vzVHymQ"
        
        let apiClient = ApiClient(token: myToken)
        apiClient.getHeroes { [weak self] heroes, error in
            self?.updateUI?(heroes)
        }
    }
    
}
