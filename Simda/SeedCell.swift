//
//  SeedCell.swift
//  Simda
//
//  Created by 전지민 on 2022/10/02.
//

import UIKit

class SeedCell: UICollectionViewCell {
    @IBOutlet weak var seedName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var keyword1: UILabel!
    @IBOutlet weak var keyword2: UILabel!
    @IBOutlet weak var keyword3: UILabel!
    
    @IBOutlet weak var seedFace: UIImageView!
    @IBOutlet weak var seedShape: UIImageView!
    
    //TODO: 데이터모델을 받아오는 방식에 따라 수정 필요
    func setSeedCell() {
        self.seedName.text = "seedName"
        self.seedName.textColor = UIColor(named: "Red")
        self.date.text = "date"
        self.keyword1.text = "keyword1"
        self.keyword2.text = "keyword2"
        self.keyword3.text = "keyword3"
        
        self.seedFace.image = UIImage(named: "face_\(1)")
        self.seedShape.image = UIImage(named: "shape_\(1)")
        self.seedShape.tintColor = UIColor(named: "Red")
    }
}
