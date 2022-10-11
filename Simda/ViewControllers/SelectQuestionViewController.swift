//
//  SelectQuestionViewController.swift
//  Simda
//
//  Created by Park Sungmin on 2022/10/04.
//

import UIKit

class SelectQuestionViewController: ViewController {

    
    @IBOutlet weak var selectQuestionTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var selectedQuestions: [Bool] = []
    var countSelectedQuestions: Int = 0 {
        didSet {
            if countSelectedQuestions == 0 {
                nextButton.backgroundColor = .Gray
            } else {
                nextButton.backgroundColor = .Main
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectedQuestions = Array(repeating: false, count: QuestionModel.dummyQuestion.count)
    
    }
 
    
    @IBAction func tapNextButton(_ sender: Any) {
        if countSelectedQuestions != 0 {
            guard let storyBoard: UIStoryboard = UIStoryboard(name: "MakingStoryView", bundle: nil) as? UIStoryboard else { return }
            guard let writeDiaryVC = storyBoard.instantiateViewController(withIdentifier: "WriteDiaryView") as? WriteDiaryViewController else { return }
            
            writeDiaryVC.selectedQuestions = getSelectedQuestions()
            
            self.navigationController?.pushViewController(writeDiaryVC, animated: true)
        }
    }
    
    func getSelectedQuestions() -> [String] {
        var result: [String] = []
        for index in 0..<QuestionModel.dummyQuestion.count {
            if selectedQuestions[index] {
                result.append(QuestionModel.dummyQuestion[index].question)
            }
        }
        print(result.count)
        return result
    }
}


extension SelectQuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionModel.dummyQuestion.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SelectQuestionTableViewCell = selectQuestionTableView.dequeueReusableCell(withIdentifier: "SelectQuestionTableViewCell", for: indexPath) as? SelectQuestionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.questionLabel.text = QuestionModel.dummyQuestion[indexPath.row].question
        
        cell.questionBackground.layer.borderColor = UIColor.DarkGray.cgColor
        cell.questionBackground.layer.borderWidth = 1
        
        return cell
    }
}

extension SelectQuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if countSelectedQuestions < 3 {
            guard let cell = tableView.cellForRow(at: indexPath) as? SelectQuestionTableViewCell else { return }
            cell.isMarked = true
            
            selectedQuestions[indexPath.row] = true
            
            countSelectedQuestions += 1
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectQuestionTableViewCell else { return }
        cell.isMarked = false
        
        selectedQuestions[indexPath.row] = false
        
        countSelectedQuestions -= 1
    }
}
