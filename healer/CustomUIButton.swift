//
//  CustomUIButton.swift
//  healer
//
//  Created by Sara on 04/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import UIKit

class CustomUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.blue
        
    }
}
