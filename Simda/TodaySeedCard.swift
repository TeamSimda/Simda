//
//  TodaySeedCard.swift
//  Simda
//
//  Created by 전지민 on 2022/10/02.
//

import UIKit

class TodaySeedCard: UIView {
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var seedName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var keyword1: UILabel!
    @IBOutlet weak var keyword2: UILabel!
    @IBOutlet weak var keyword3: UILabel!
    
//    @IBOutlet weak var seedFace: UIImageView!
//    @IBOutlet weak var seedShape: UIImageView!
//    @IBOutlet weak var seedColor: UIImageView!
    
    func setup() {
        keyword1.clipsToBounds = true
        keyword1.layer.cornerRadius = 14
        keyword2.clipsToBounds = true
        keyword2.layer.cornerRadius = 14
        keyword3.clipsToBounds = true
        keyword3.layer.cornerRadius = 14
    }
}
