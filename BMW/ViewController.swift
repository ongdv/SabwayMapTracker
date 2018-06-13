//
//  ViewController.swift
//  BMW
//
//  Created by Kyeong woo Oh on 2018. 6. 14..
//  Copyright © 2018년 Kyeong woo Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var myData:String = "1";
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var btnSeoMyeon : UIButton!
    var btnNangJeong : UIButton!
    var startS : UIButton!
    var endS :UIButton!
    var clickBtn = 0;
    var startStation = "";
    var endStation = "";
    var getStartStation = 0;
    
    var pinchGesture = UIPinchGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = false;
        
        //scrollView, imageView, informationView 선언, 추가
        let frameSize = view.bounds.size;
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint.zero, size: frameSize));
        
        let image = UIImage(named: "map.png");
        imageView = UIImageView(image:image);
        scrollView.contentSize = imageView.bounds.size;
        
        scrollView.addSubview(imageView);
        view.addSubview(scrollView);
        
        
        //줌인, 줌아웃 조절 및 추가(함수)
        scrollView.minimumZoomScale = 1;
        scrollView.maximumZoomScale = 3.0;
        
        scrollView.delegate = self;
        
        let doubleTab = UITapGestureRecognizer(target: self, action: #selector(self.tapToZoom));
        doubleTab.numberOfTapsRequired = 2;
        doubleTab.numberOfTouchesRequired = 1
        
        //스크롤뷰에 이벤트 추가
        scrollView.addGestureRecognizer(doubleTab);
        
        
        //add button
        //역 정보 버튼 생성(냉정 ,서면)
        startS = UIButton(); // 출발역 표시용 버튼
        endS = UIButton(); //도착역 표시용 버튼
        
        btnSeoMyeon = UIButton();
        btnNangJeong = UIButton();
        
        btnSeoMyeon.frame = CGRect(x: 790, y:609, width:20, height:20);
        btnSeoMyeon.backgroundColor = UIColor.clear;
        btnSeoMyeon.layer.cornerRadius=10;
        
        
        btnNangJeong.frame = CGRect(x: 561, y: 609, width:20, height:20);
        btnNangJeong.backgroundColor = UIColor.clear;
        btnNangJeong.layer.cornerRadius = 10;
        
        //역 정보 버튼 삽입
        imageView.addSubview(btnSeoMyeon);
        imageView.addSubview(btnNangJeong);
        
        //역 정보 이벤트 등록
        btnSeoMyeon.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside);
        btnNangJeong.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside);
        
        //역 정보 입력
        btnSeoMyeon.titleLabel?.text="서면";
        btnNangJeong.titleLabel?.text="냉정";
        //print(btnSeoMyeon.titleLabel!.text!);
        
        //이미지 인터렉션 허용...
        imageView.isUserInteractionEnabled = true
        
    }
    //줌인, 줌아웃 구현
    @objc func tapToZoom(gestureRecognizer: UIGestureRecognizer){
        if(scrollView.zoomScale == CGFloat(1)){
            scrollView.setZoomScale(3, animated: true);
            print("줌 인");
        }else{
            scrollView.setZoomScale(1, animated: true)
            print("줌 아웃");
        }
    }
    
    @objc func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    @objc func btnAction(_ sender: UIButton){
        clickBtn+=1;
        print(sender.titleLabel!.text!);
        print(clickBtn);
        
        if(startStation == "" || endStation == ""){
            let popAlert = UIAlertController(title: "\(sender.titleLabel!.text!)", message: "", preferredStyle: UIAlertControllerStyle.alert);
            
            let startAlertAction = UIAlertAction(title: "출발역", style: UIAlertActionStyle.default, handler: { (alert) in
                self.startS.backgroundColor = UIColor.clear;
                self.startS = sender;
                self.startS.backgroundColor = UIColor.green;
                self.startStation = sender.titleLabel!.text!
                print("출발역은 \(sender.titleLabel!.text!)")
                self.alertControl();
            });
            
            let endAlertAction = UIAlertAction(title:"도착역", style: UIAlertActionStyle.default, handler: {(alert) in
                self.endS.backgroundColor = UIColor.clear;
                self.endS = sender;
                self.endS.backgroundColor = UIColor.red;
                self.endStation = sender.titleLabel!.text!;
                print("도착역 \(sender.titleLabel!.text!)")
                self.alertControl();
            });
            let cancelAlertAction = UIAlertAction(title: "닫기", style: UIAlertActionStyle.default);
            let getInformationAlertAction = UIAlertAction(title: "역정보", style: UIAlertActionStyle.default, handler: {(action) -> Void in
                self.performSegue(withIdentifier: "information", sender: self);
                self.clickBtn = self.clickBtn - 1;
            })
            
            popAlert.addAction(startAlertAction);
            popAlert.addAction(endAlertAction);
            popAlert.addAction(getInformationAlertAction);
            popAlert.addAction(cancelAlertAction);
            self.present(popAlert, animated: true, completion: nil);
        }
    }
    func alertControl(){
        if(startStation != "" && endStation != ""){
            let popAlert = UIAlertController(title: "구현 준비중!", message: "", preferredStyle: UIAlertControllerStyle.alert);
            let okAlertAction = UIAlertAction(title: "승인", style: UIAlertActionStyle.default, handler: { (alert) in
                self.startStation = "";
                self.endStation = "";
                self.startS.backgroundColor = UIColor.clear;
                self.startS = UIButton();
                self.endS.backgroundColor = UIColor.clear;
                self.startS = UIButton();
            });
            popAlert.addAction(okAlertAction);
            self.present(popAlert, animated: true, completion: nil);
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "information", let dest = segue.destination as? informationViewController {
            print(myData);
            dest.data = myData;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
