//
//  HomeController.swift
//  healer
//
//  Created by Sara on 04/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet var buttonChecker: UIButton!
    @IBOutlet var buttonStats: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        buttonChecker?.layer.cornerRadius = 25
        buttonStats?.layer.cornerRadius = 25
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonStats(_ sender: UIButton) {
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
    @IBAction func buttonClick(_ sender: UIButton) {
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
