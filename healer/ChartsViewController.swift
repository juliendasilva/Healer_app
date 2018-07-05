//
//  ChartsViewController.swift
//  healer
//
//  Created by Sara on 05/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import SwiftyJSON

class ChartsViewController: UIViewController {
    
    func constipation() {
        let urlString = "https://inspecteurdoc.scalingo.io/rest/api/constipation"
        Alamofire.request(urlString, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                print("get data is called")
                let jsonVariable = JSON(value)
                let responseArray = jsonVariable.arrayValue
                
                var values = [ChartDataEntry(x: 0, y: Double(responseArray[0]["compteur"].intValue))]
                var counter : Double = 1
                for object in responseArray {
                    values.append(ChartDataEntry(x: counter, y: Double(object["compteur"].intValue)))
                    counter = counter + 1
                }
                let set1 = LineChartDataSet(values: values, label: "Constipation")
                let data = LineChartData(dataSet: set1)
                
                let gradientColors = [UIColor(red:0.84, green:0.80, blue:0.97, alpha:1.0).cgColor, UIColor(red:0.84, green:0.80, blue:0.97, alpha:1.0).cgColor] as CFArray
                let colorLocations:[CGFloat] = [1.0, 0.0]
                let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)
                set1.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0)
                set1.drawFilledEnabled = true
                set1.mode = .cubicBezier
                set1.drawCirclesEnabled = false
                set1.setColor(UIColor(red:0.67, green:0.62, blue:0.92, alpha:1.0))
                print(self.lineChartView)
                set1.lineWidth = 2.5;
                self.lineChartView.xAxis.drawGridLinesEnabled = false
                self.lineChartView.xAxis.drawAxisLineEnabled = false
                self.lineChartView.leftAxis.enabled = false
                self.lineChartView.rightAxis.enabled = false
                self.lineChartView.animate(xAxisDuration: 0.0, yAxisDuration: 0.5, easingOption: .easeInSine)
                self.lineChartView.chartDescription?.text = "constipation"
                self.lineChartView.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:0.5)
                self.lineChartView.legend.enabled = false
                self.lineChartView.data = data
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constipation()
        
    }
    
    @IBOutlet var lineChartView: LineChartView!
    
}
