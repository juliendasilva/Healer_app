//
//  getDatas.swift
//  healer
//
//  Created by Sara on 04/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_Synchronous
import SwiftyJSON

func getData() {
    print("getData is called")
    let urlString = "https://inspecteurdoc.scalingo.io/rest/api?start=1"
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var questionLabel : String? = appDelegate?.questionLabel
    
    Alamofire.request(urlString, encoding: JSONEncoding.default, headers: nil).responseJSON {
        response in
        switch response.result {
        case .success(let value):
            print("success")
            let jsonVariable = JSON(value)
            let responseArray = jsonVariable["reponses"].arrayValue
            
            let question = Question()

            for object in responseArray {
                let response = Response()
                response.reponse = object["reponse"].stringValue
                response.id = object["id"].intValue
                question.response.append(response)
            }
            question.questionId = jsonVariable["id"].intValue
            question.label = jsonVariable["question"].stringValue
            questionLabel = question.label
            print("getData is called")
            break
        case .failure(let error):
            print(error)
        }
    }
}
