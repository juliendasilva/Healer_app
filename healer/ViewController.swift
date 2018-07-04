//
//  ViewController.swift
//  healer
//
//  Created by julien da silva on 03/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet var headerContainer: UIView!
    @IBOutlet var question: UILabel!
    @IBOutlet var validateButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData() //appel d'API
        self.question.text = Question().label
        setUpStyles()
        
        // si besoin plus tard de recharger les informations dans le TableView
        // tableView.reloadData()
        // => ça va réappeler le dataSource et TADA !!!
        // voir code ci-dessous -- getData
    }
    
    func setUpStyles() {
        validateButton?.layer.cornerRadius = 8
        headerContainer?.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //combien de cellules = combien de questions retournées par l'API
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // on retourne une cellule pour une question
        
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath)
        
        // injecter la question dans la cellule pour la remplir avec les informations
        
        return cell
    }
    
    
}

