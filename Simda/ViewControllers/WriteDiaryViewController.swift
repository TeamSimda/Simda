//
//  WriteDiaryViewController.swift
//  Simda
//
//  Created by Park Sungmin on 2022/10/04.
//

import UIKit

class WriteDiaryViewController: ViewController {

    var selectedQuestions: [String] = []
    
    @IBOutlet weak var paddingViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var questionListViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionTableView: UITableView!
    
    var questionTableViewCellHeight: CGFloat = 30
    
    var isShowingQuestionTableView: Bool = true {
        didSet {
            // 함수 호출
            if isShowingQuestionTableView {
                print("true")
                questionListViewHeightConstraint.constant = CGFloat(50 + selectedQuestions.count * 30)
            } else {
                print("false")
                questionListViewHeightConstraint.constant = 50
            }
        }
    }
    
    var isKeyboardExpand: Bool = false {
        willSet(newValue) {
            if newValue {
                isShowingQuestionTableView = false
            } else {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isShowingQuestionTableView = true
        
        // 키보드 작동 감지
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func tapShowQuestionTableViewButton(_ sender: Any) {
        isShowingQuestionTableView.toggle()
    }
    
    @objc func keyboardAppear(_ notification: Notification) {
        if !isKeyboardExpand {
            isKeyboardExpand = true
            
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                
                paddingViewHeightContraint.constant = keyboardHeight - 35
            }
        }
    }
    
    @objc func keyboardDisappear() {
        if isKeyboardExpand {
            isKeyboardExpand = false
            
            paddingViewHeightContraint.constant = 30
        }
    }
}

extension WriteDiaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: WriteQuestionTableViewCell = questionTableView.dequeueReusableCell(withIdentifier: "WriteQuestionTableViewCell", for: indexPath) as? WriteQuestionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.questionLabel.text = selectedQuestions[indexPath.row]
        return cell
    }
}

extension WriteDiaryViewController: UITableViewDelegate {
    
}
