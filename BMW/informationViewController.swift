//
//  informationViewController.swift
//  BMW
//
//  Created by Kyeong woo Oh on 2018. 6. 14..
//  Copyright © 2018년 Kyeong woo Oh. All rights reserved.
//

import UIKit

class informationViewController: UIViewController {
    var txtStation: UITextField!
    var middleText: String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 바 표시, title 표시(역 이름)
        self.navigationController?.isNavigationBarHidden = false;
        self.navigationController?.title = middleText;
        
        //뷰 디자인
        
        
    
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
