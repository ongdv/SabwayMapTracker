//
//  mapViewController.swift
//  BMW
//
//  Created by Kyeong woo Oh on 2018. 6. 14..
//  Copyright © 2018년 Kyeong woo Oh. All rights reserved.
//

import UIKit

class mapViewController: UIViewController {
    var imgView :UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imgView = UIImageView();
        imgView.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height*0.4);
        imgView.image = UIImage(named: "SeoMyeon.gif");
        view.addSubview(imgView);
        print(view.frame.height);
        
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
