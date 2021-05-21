//
//  GuessViewController.swift
//  GuessNumber
//
//  Created by Owner on 2021/05/15.
//

import UIKit

class GuessViewController: UIViewController {
    
    let ans = Int.random(in: 0...100)
    var min = 0
    var max = 100
    var time = 0
    var count = 0
    
    var timer:Timer?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        setTitle(x: min, y: max)
        button1.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
    }

    func setTitle(x:Int, y:Int){
        questionLabel.text = "\(x)から\(y)までに"
        var answerList = [Int.random(in:x...y)]
        if x != y {
            while answerList.count<2 {
                let randomanswer = Int.random(in:x...y)
                if !answerList.contains(randomanswer){
                    answerList.append(randomanswer)
                }
            }
            answerList.sort{$0 < $1}
            button1.setTitle(String(answerList[0]), for: .normal)
            button2.setTitle(String(answerList[1]), for: .normal)
        } else{
            button1.setTitle(String(answerList[0]), for: .normal)
            button2.setTitle("", for: .normal)

        }
    }
    
    @objc func onButton(_ sender:UIButton){
        count += 1
        let input = Int(sender.currentTitle!)!
        if input == ans{
            timer!.invalidate()
            performSegue(withIdentifier: "result", sender: nil)
        }
        else{
            let m = input - ans
            if m<0{
                min = input + 1
                hintLabel.text = "ヒント : \(input)より大きく"
            } else{
                max = input - 1
                hintLabel.text = "ヒント : \(input)より小さく"
            }
        }
        setTitle(x: min, y: max)
    }
    
    @objc func countTime(){
        time += 1
        timeLabel.text = "\(time)秒経過"
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        let  nextVC = segue.destination as! ResultViewController
        nextVC.count = count
        nextVC.time = time
        nextVC.ans = ans
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
