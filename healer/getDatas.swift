//
//  getDatas.swift
//  healer
//
//  Created by Sara on 04/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getData() {
    print("getData is called")
    let urlString = "http://172.20.10.2:8000/rest/api"
    
    Alamofire.request(urlString, parameters: ["start": "1"],encoding: JSONEncoding.default, headers: nil).responseJSON {
        response in
        switch response.result {
        case .success(let value):
            let jsonVariable = JSON(value)
            print("JSON: \(jsonVariable)")
            let responseArray = jsonVariable["response"].arrayValue
            
            let question = Question()
            
            for object in responseArray {
                let response = Response()
                response.responseText = object["responseText"].stringValue
                response.id = object["id"].intValue
                question.response.append(response)
            }
            
            question.questionId = jsonVariable["questionId"].intValue
            question.label = jsonVariable["question"].stringValue
            
//            return responseArray
            break
        case .failure(let error):
            print(error)
        }
    }
}
