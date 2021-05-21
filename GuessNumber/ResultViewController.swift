//
//  ResultViewController.swift
//  GuessNumber
//
//  Created by Owner on 2021/05/16.
//

import UIKit

class ResultViewController: UIViewController {
    
    var count = 0
    var time = 0
    var ans = 0
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeLabel.text = "探索時間 : \(time)秒"
        countLabel.text = "探索回数 : \(count)回"
        answerLabel.text = "【答えは\(ans)です】"
    }
    
    @IBAction func onBackTop(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
