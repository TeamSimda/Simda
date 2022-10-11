//
//  WriteDiaryViewController.swift
//  Simda
//
//  Created by Park Sungmin on 2022/10/04.
//

import UIKit

class WriteDiaryViewController: ViewController {
    
    var selectedQuestions: [String] = []
    
    // Question List View
    @IBOutlet weak var paddingViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var questionListViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionTableView: UITableView!
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var diaryField: UITextView!
    
    // Editing View
    @IBOutlet weak var editingView: UIView!
    @IBOutlet weak var editingTitleField: UITextField!
    @IBOutlet weak var editingDiaryField: UITextView!
    @IBOutlet weak var editingDiaryPlaceholder: UITextView!
    
    // Check Retrospect View
    @IBOutlet weak var checkRetrospectView: UIView!
    
    var titleContent: String = ""
    var diaryContent: String = ""
    
    var questionTableViewCellHeight: CGFloat = 35
    
    var isEditingDiary: Bool = false {
        didSet {
            
            UIView.animate(withDuration: 0.3) {
                self.editingView.alpha = self.isEditingDiary ? 1 : 0
            }
        }
    }
    
    var isShowingQuestionTableView: Bool = true {
        didSet {
            // 함수 호출
            
            if isShowingQuestionTableView {
                print("true")
                questionListViewHeightConstraint.constant = CGFloat(60 + selectedQuestions.count * Int(CGFloat(questionTableViewCellHeight)))
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
        
        // 키보드 작동 감지
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Tap Gesture 연결
        let tapTitleGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let tapDiaryGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        titleField.isUserInteractionEnabled = true
        diaryField.addGestureRecognizer(tapTitleGesture)
        titleField.addGestureRecognizer(tapDiaryGesture)
        
        // 초기 설정
        isShowingQuestionTableView = true
        
        editingDiaryField.delegate = self
        
        self.editingView.alpha = 0
        self.editingView.isHidden = false
        
        self.checkRetrospectView.isHidden = true
    }
    
    
    
    @IBAction func tapFinishEditingButton(_ sender: Any) {
        view.endEditing(true)
        
        titleContent = editingTitleField.text ?? ""
        diaryContent = editingDiaryField.text
        
        titleField.text = titleContent
        diaryField.text = diaryContent
        
        isEditingDiary = false
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        self.checkRetrospectView.isHidden = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func tapShowQuestionTableViewButton(_ sender: Any) {
        isShowingQuestionTableView.toggle()
    }
    
    
}

// objc function
extension WriteDiaryViewController {
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
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        isEditingDiary = true
    }
}

// TableView
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

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.hasText {
            editingDiaryPlaceholder.isHidden = true
        } else {
            editingDiaryPlaceholder.isHidden = false
        }
    }
}
