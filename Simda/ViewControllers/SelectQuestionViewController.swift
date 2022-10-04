//
//  SelectQuestionViewController.swift
//  Simda
//
//  Created by Park Sungmin on 2022/10/04.
//

import UIKit

class SelectQuestionViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tapNextButton(_ sender: Any) {
        guard let storyBoard: UIStoryboard = UIStoryboard(name: "MakingStoryView", bundle: nil) as? UIStoryboard else { return }
        guard let writeDiaryVC = storyBoard.instantiateViewController(withIdentifier: "WriteDiaryView") as? WriteDiaryViewController else { return }
                
        self.navigationController?.pushViewController(writeDiaryVC, animated: true)
    }
}

extension SelectQuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension SelectQuestionViewController: UITableViewDelegate {
    
}
