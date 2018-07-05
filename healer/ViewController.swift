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
    
    @IBAction func validateButtonFunc(_ sender: Any) {
        questionClass = Question()
        workflow(url: "reponse=3")
    }
    @IBOutlet var tableView: UITableView!
    var questionClass = Question()
    var myIndex = 0
    
    func workflow( url: String) {
        let urlString = "https://inspecteurdoc.scalingo.io/rest/api?\(url)"
        Alamofire.request(urlString, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                print("get data is called")
                let jsonVariable = JSON(value)
                self.question.text = jsonVariable["question"].stringValue
                
                
                let responseArray = jsonVariable["reponses"].arrayValue
                
                for object in responseArray {
                    let response = Response()
                    response.reponse = object["reponse"].stringValue
                    response.id = object["id"].intValue
                    self.questionClass.response.append(response)
                }
                self.questionClass.questionId = jsonVariable["id"].intValue
                self.questionClass.label = jsonVariable["question"].stringValue
                self.tableView.reloadData()
                
                print("getData is finished")
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.white
        workflow(url: "start=1")
        setUpStyles()
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
        return questionClass.response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // on retourne une cellule pour une question
        
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        // injecter la question dans la cellule pour la remplir avec les informations
        if(questionClass.response.count > 0){
            cell.cellLabel.text = questionClass.response[indexPath.row].reponse
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
        print("myIndex\(myIndex)")
    }
    
}

