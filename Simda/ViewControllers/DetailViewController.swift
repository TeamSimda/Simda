//
//  DetailViewController.swift
//  Simda
//
//  Created by 전지민 on 2022/10/13.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var seedName: UILabel!
    @IBOutlet weak var keyword1: TagLabel!
    @IBOutlet weak var keyword2: TagLabel!
    @IBOutlet weak var keyword3: TagLabel!
    
    @IBOutlet weak var question1: QuestionLabel!
    @IBOutlet weak var question2: QuestionLabel!
    @IBOutlet weak var question3: QuestionLabel!
    
    @IBOutlet weak var diaryContent: UILabel!
    @IBOutlet weak var diaryTitle: UILabel!
    
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var evolveButton: UIButton!
    
    
    @IBOutlet weak var shape: UIImageView!
    @IBOutlet weak var face: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setSeedDetail()
    }
    private func setUI() {
        keyword1.clipsToBounds = true
        keyword1.layer.cornerRadius = 14
        keyword2.clipsToBounds = true
        keyword2.layer.cornerRadius = 14
        keyword3.clipsToBounds = true
        keyword3.layer.cornerRadius = 14
        
        question1.clipsToBounds = true
        question1.layer.cornerRadius = 10
        question2.clipsToBounds = true
        question2.layer.cornerRadius = 10
        question3.clipsToBounds = true
        question3.layer.cornerRadius = 10
        
        contentBackgroundView.layer.cornerRadius = 10
        evolveButton.clipsToBounds = true
        evolveButton.layer.cornerRadius = 25
    }
    
    //TODO: 모델 생성 후 수정 필요
    private func setSeedDetail() {
        self.seedName.text = "test"
        self.seedName.textColor = UIColor(named: "Red")
        self.keyword1.text = "#key1"
        self.keyword2.text = "#key2"
        self.keyword3.text = "#key3"
        self.question1.text = "question1"
        self.question2.text = "question2"
        self.question3.text = "question3"
        self.diaryTitle.text = "냠냠한 하루"
        self.diaryContent.text = "아아아아ㅏ아아나는 일기를 쓴다"
        self.evolveButton.tintColor = UIColor(named: "Red")
        self.evolveButton.setTitle("진화하기", for: .normal)
        self.shape.image = UIImage(named: "shape_8")
        self.shape.tintColor = UIColor(named: "Red")
        self.face.image = UIImage(named: "face_8")
    }


}

