//
//  TodaySeedCard.swift
//  Simda
//
//  Created by 전지민 on 2022/10/02.
//

import UIKit

class TodaySeedCard: UIView {
    @IBOutlet weak var seedName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var keyword1: UILabel!
    @IBOutlet weak var keyword2: UILabel!
    @IBOutlet weak var keyword3: UILabel!
    
    @IBOutlet weak var seedFace: UIImageView!
    @IBOutlet weak var seedShape: UIImageView!
    
    func setUI() {
        keyword1.clipsToBounds = true
        keyword1.layer.cornerRadius = 14
        keyword2.clipsToBounds = true
        keyword2.layer.cornerRadius = 14
        keyword3.clipsToBounds = true
        keyword3.layer.cornerRadius = 14
    }
    
    func setCard(seedName: String, date: String, keyword1: String, keyword2: String, keyword3: String, shapeIndex: Int, faceIndex: Int, colorName: String) {
        self.seedName.text = seedName
        self.seedName.textColor = UIColor(named: colorName)
        self.date.text = date
        self.keyword1.text = keyword1
        self.keyword2.text = keyword2
        self.keyword3.text = keyword3
        
        self.seedFace.image = UIImage(named: "face_\(faceIndex)")
        self.seedShape.image = UIImage(named: "shape_\(shapeIndex)")
        self.seedShape.tintColor = UIColor(named: colorName)
    }
    
}
