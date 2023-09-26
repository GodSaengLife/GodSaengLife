//
//  AlarmOffViewController.swift
//  GodSaengLife
//
//  Created by Jongbum Lee on 2023/09/26.
//

import UIKit

class AlarmOffViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        print("AlarmOffViewController viewWillAppear called")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AlarmOffViewController viewDidLoad called")
        
        view.backgroundColor = .black
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
