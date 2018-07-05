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

//func getData(urlString: String, questionClass: Question, question: UILabel) {
//    Alamofire.request(urlString, encoding: JSONEncoding.default, headers: nil).responseJSON {
//        response in
//        switch response.result {
//        case .success(let value):
//            print("get data is called")
//            let jsonVariable = JSON(value)
//            question.text = jsonVariable["question"].stringValue
//            
//            
//            let responseArray = jsonVariable["reponses"].arrayValue
//            
//            for object in responseArray {
//                let response = Response()
//                response.reponse = object["reponse"].stringValue
//                response.id = object["id"].intValue
//                questionClass.response.append(response)
//            }
//            questionClass.questionId = jsonVariable["id"].intValue
//            questionClass.label = jsonVariable["question"].stringValue
//            self.tableView.reloadData()
//            
//            print("getData is finished")
//            break
//        case .failure(let error):
//            print(error)
//        }
//    }
//}
