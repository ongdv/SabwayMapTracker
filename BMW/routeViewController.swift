//
//  routeViewController.swift
//  BMW
//
//  Created by Kyeong woo Oh on 2018. 6. 14..
//  Copyright © 2018년 Kyeong woo Oh. All rights reserved.
//

import UIKit

class routeViewController: UIViewController {
    var selectRide: String = "";
    
    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var lblMiddle: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    
    @IBOutlet weak var btnMiddle: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLeft.isHidden = true;
        btnMiddle.isHidden = true;
        btnRight.isHidden = true;
        
        let popAlert = UIAlertController(title: "이동수단 선택", message: "", preferredStyle: UIAlertControllerStyle.alert);
        let stairAction = UIAlertAction(title: "계단/에스컬레이터", style: .default, handler: { (alert) in
            self.selectRide = "stair";
        });
        let elevatorAction = UIAlertAction(title: "엘레베이터", style: .default, handler: { (alert) in
            self.selectRide = "elevator";
        });
        popAlert.addAction(stairAction);
        popAlert.addAction(elevatorAction);
        present(popAlert, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        lblLeft.text = "범내골방면"
        lblMiddle.text = "중간"
        lblRight.text = "부전역방면"
        btnLeft.isHidden = false;
        btnMiddle.isHidden = false;
        btnRight.isHidden = false;
        imgView.image = UIImage(named: "SeoMyeon.gif");
        imgView2.image = UIImage(named: "map.png")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        lblLeft.text = "부암역방면"
        lblMiddle.text = "중간"
        lblRight.text = "전포역방면"
        btnLeft.isHidden = false;
        btnMiddle.isHidden = false;
        btnRight.isHidden = false;
        imgView.image = UIImage(named: "SeoMyeon.gif");
        imgView2.image = UIImage(named: "map.png")
    }
    @IBAction func btnLeftClick(_ sender: UIButton) {
        if(selectRide == "stair"){
            imgView.image = UIImage(named: "계단_left.png");
            imgView2.image = UIImage(named: "편의점.png");
        }
        else{
            imgView.image = UIImage(named:"엘베_left.png");
            imgView2.image = UIImage(named: "화장실.png");
        }
        
    }
    @IBAction func btnMiddleClick(_ sender: UIButton) {
        
    }
    @IBAction func btnRightClick(_ sender: UIButton) {
        if(selectRide == "stair"){
            imgView.image = UIImage(named: "계단_right.png");
           imgView2.image = UIImage(named: "편의점.png");
    
        }
        else{
            imgView.image = UIImage(named:"엘베_right");
            imgView2.image = UIImage(named: "화장실.png");
        }
        
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
