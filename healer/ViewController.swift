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
    var questionClass = Question()
    var indexOfSelectedItem : Int!
    
    @IBAction func validateButtonFunc(_ sender: QuestionTableViewCell) {
        questionClass = Question()
        //concaténation "response=\(indiceOfSelectedItem)"
        workflow(url: "reponse=3")
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
    
    func workflow( url: String) {
        let urlString = "https://inspecteurdoc.scalingo.io/rest/api?\(url)"
        Alamofire.request(urlString, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let value):
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
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.white
        tableView.rowHeight = CGFloat(90)
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
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionClass.response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        if(questionClass.response.count > 0){
            cell.cellLabel.text = questionClass.response[indexPath.row].reponse
            cell.cellLabel?.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:0.5)
            cell.cellLabel.layer.borderColor = UIColor.white.cgColor
            cell.cellLabel.layer.borderWidth = 5
        }
        return cell
    }
    
    // à la sélection d'une cell, récupère l'id de la cell cliquée pour la renvoyer dans validateButtonFunc
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: NSIndexPath!) {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath as IndexPath) as! QuestionTableViewCell
        if(questionClass.response.count > 0){
            indexOfSelectedItem = questionClass.response[indexPath.row].id
        }
        if cell.isSelected {
           //cell.cellLabelView.backgroundColor = UIColor(red:0.24, green:0.91, blue:0.69, alpha:1.0)
        }
    }
   
}

