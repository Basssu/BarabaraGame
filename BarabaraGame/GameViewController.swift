//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by Yuma Ishibashi on 2021/05/09.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer!
    var score = 1000
    let defaults = UserDefaults.standard
    let width: CGFloat = UIScreen.main.bounds.size.width
    var positionX: [CGFloat] = [0.0, 0.0, 0.0] //画像の位置
    var dx: [CGFloat] = [1.0, 0.5, -1.0]// 画像を動かす幅の配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2]
        self.start()
        // Do any additional setup after loading the view.
    }
    
    @objc func up() {
        for i in 0..<3 {
        
            //端にきたら動かす向きを逆にする]
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i] //画像の位置をdxずらす
        }
        imgView1.center.x = positionX[0] //上の画像をずらした位置に移動させる
        imgView2.center.x = positionX[1] //真ん中の画像をずらした位置に移動する
        imgView3.center.x = positionX[2] //下の画像をずらした位置に移動する
    }
    
    @IBAction func stop() {
        if timer.isValid == true{ //もしタイマーが動いてたら
            timer.invalidate()
            for i in 0..<3 {
                score = score - abs(Int(width/2 - positionX[i]))*2
                resultLabel.text = "Score: " + String(score)
                resultLabel.isHidden = false
            
            }
            let score1 = defaults.integer(forKey: "score1")
            let score2 = defaults.integer(forKey: "score2")
            let score3 = defaults.integer(forKey: "score3")
            if score1 < score {
                defaults.set(score, forKey: "score1")
                defaults.set(score1, forKey: "score2")
                defaults.set(score2, forKey: "score3")
            }else if score2 < score {
                defaults.set(score, forKey: "score2")
                defaults.set(score2, forKey: "score3")
            }else if score3 < score {
                defaults.set(score, forKey: "score3")
            }
        }
    }
    
    @IBAction func retry() {
        score = 1000
        positionX = [width/2, width/2, width/2]
        if !timer.isValid {
            self.start()
        }
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func start() {
        resultLabel.isHidden = true
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.005,target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
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
