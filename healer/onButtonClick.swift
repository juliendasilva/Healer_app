//
//  onButtonClick.swift
//  healer
//
//  Created by Sara on 05/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import Foundation
import UIKit

func clickButton(_ sender : UIButton) {
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
