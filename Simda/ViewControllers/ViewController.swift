//
//  ViewController.swift
//  Simda
//
//  Created by kimhyeongmin on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DEBUGBUTTON(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MakingStoryView", bundle: nil)
        let selectQuestionVC = storyBoard.instantiateViewController(withIdentifier: "SelectQuestionView") as! SelectQuestionViewController
        
        self.navigationController?.pushViewController(selectQuestionVC, animated: true)
    }
}

