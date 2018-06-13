//
//  informationViewController.swift
//  BMW
//
//  Created by Kyeong woo Oh on 2018. 6. 14..
//  Copyright © 2018년 Kyeong woo Oh. All rights reserved.
//

import UIKit

class informationViewController: UIViewController {
    var txtMiddleValue: UITextField!
    var scrollView :UIScrollView!
    var data: String? = "1";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 바 표시, title 표시(역 이름)
        self.navigationController?.isNavigationBarHidden = false;
        self.navigationController?.title = data;
        
        //스크롤뷰 디자인
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint.zero, size: view.bounds.size));
        scrollView.backgroundColor = UIColor.red;
        self.view.addSubview(scrollView);
        
        
        txtMiddleValue = UITextField(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: view.frame.width, height:50)));
        txtMiddleValue?.text = "12345";
        txtMiddleValue?.backgroundColor = UIColor.blue;
        scrollView.addSubview(txtMiddleValue)
        
        
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
