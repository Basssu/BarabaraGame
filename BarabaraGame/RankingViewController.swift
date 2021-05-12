//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by Yuma Ishibashi on 2021/05/09.
//

import UIKit

class RankingViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label1.text = String(defaults.integer(forKey: "score1"))
        label2.text = String(defaults.integer(forKey: "score2"))
        label3.text = String(defaults.integer(forKey: "score3"))
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
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
