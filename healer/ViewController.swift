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
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    let urlString = "https://inspecteurdoc.scalingo.io/rest/api?start=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
        var questionLabelDelegate : String? = appDelegate?.questionLabel
        
        Alamofire.request(urlString, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                print("get data is called")
                let jsonVariable = JSON(value)
                
                questionLabelDelegate = jsonVariable["question"].stringValue
                self.question.text = questionLabelDelegate
                
                let responseArray = jsonVariable["reponses"].arrayValue
                
                let questionClass = Question()
                questionLabelDelegate = questionClass.label
                
                for object in responseArray {
                    let response = Response()
                    response.reponse = object["reponse"].stringValue
                    response.id = object["id"].intValue
                    questionClass.response.append(response)
                }
                print(questionClass.response[0])
                questionClass.questionId = jsonVariable["id"].intValue
                questionClass.label = jsonVariable["question"].stringValue
                print("getData is finished")
                break
            case .failure(let error):
                print(error)
            }
        }
        //
        setUpStyles()

        // si besoin plus tard de recharger les informations dans le TableView
//         tableView.reloadData()
        // => ça va réappeler le dataSource et TADA !!!
        // voir code ci-dessous -- getData
    }
    
    func setUpStyles() {
        validateButton?.layer.cornerRadius = 25
        headerContainer?.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickButton(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.1,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.875, y: 0.86)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.1, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //combien de cellules = combien de questions retournées par l'API
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // on retourne une cellule pour une question
        
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath)
        // injecter la question dans la cellule pour la remplir avec les informations
        
        return cell
    }
    
    
}

