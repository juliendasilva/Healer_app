//
//  QuestionTableViewCell.swift
//  healer
//
//  Created by Sara on 04/07/2018.
//  Copyright © 2018 julien da silva. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    static let identifier = "cellQuestion"
    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
