//
//  SelectQuestionTableViewCell.swift
//  Simda
//
//  Created by Park Sungmin on 2022/10/05.
//

import Foundation
import UIKit

class SelectQuestionTableViewCell: UITableViewCell {
    
    var isMarked: Bool  = false {
        didSet {
            if isMarked {
                questionBackground.backgroundColor = .DarkGray
            } else {
                questionBackground.backgroundColor = .none
            }
        }
    }
    
    @IBOutlet weak var questionBackground: UIView!
    @IBOutlet weak var questionLabel: UILabel!
}

