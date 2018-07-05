//
//  ChartsViewController.swift
//  healer
//
//  Created by Sara on 05/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let values = [
            ChartDataEntry(x: 1, y: 2),
            ChartDataEntry(x: 2, y: 3),
            ChartDataEntry(x: 3, y: 4),
            ChartDataEntry(x: 4, y: 6),
            ChartDataEntry(x: 5, y: 5),
            ChartDataEntry(x: 6, y: 6),
            ChartDataEntry(x: 7, y: 4),
            ChartDataEntry(x: 8, y: 3),
            ChartDataEntry(x: 9, y: 4),
            ]
        
        let set1 = LineChartDataSet(values: values, label: "Gastro-entérite")
        let data = LineChartData(dataSet: set1)
        
        let gradientColors = [UIColor(red:0.84, green:0.80, blue:0.97, alpha:1.0).cgColor, UIColor(red:0.84, green:0.80, blue:0.97, alpha:1.0).cgColor] as CFArray
        let colorLocations:[CGFloat] = [1.0, 0.0] // Positioning of the gradient
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
        set1.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
        set1.drawFilledEnabled = true // Draw the Gradient
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
        self.lineChartView.chartDescription?.text = "Gastro-entérite"
        self.lineChartView.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:0.5)
        self.lineChartView.legend.enabled = false
        self.lineChartView.data = data
    }
    
    @IBOutlet var lineChartView: LineChartView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
