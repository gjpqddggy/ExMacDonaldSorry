//
//  eggrollController.swift
//  test
//
//  Created by 馮謙 on 2018/2/19.
//  Copyright © 2018年 馮謙. All rights reserved.
//

import UIKit

class spicyburgerTimeController: UIViewController {
    
    // 使用 UILabel(frame:) 建立一個 UILabel
    let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 10))
    
    var setTime = 120
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 建立背景圖片
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
        myImageView.image = UIImage(named: "spicyburgerCounter.png")//
        myImageView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(myImageView)
        
        // 建立返回鍵
        let myButton = UIButton(type: .system)
        myButton.frame = CGRect(
            x: 0, y: 0, width: 40, height: 40)
        myButton.backgroundColor = UIColor.clear
        myButton.addTarget(
            nil,
            action: #selector(goBack),
            for: .touchUpInside)
        myButton.frame.origin.x = 0
        myButton.frame.origin.y = 20
        self.view.addSubview(myButton)
        
        // 建立倒數計時
        myLabel.text = String(setTime/60) + ":" + String(format: "%02d", setTime%60)
        myLabel.textColor = UIColor.init(red: 255/255, green: 248/255, blue: 200/255, alpha: 1)
        myLabel.font = UIFont.systemFont(ofSize: 21)
        myLabel.textAlignment = .center
        myLabel.numberOfLines = 1
        myLabel.bounds = CGRect(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5, width: 60, height: 30)
        myLabel.center = CGPoint(x: fullScreenSize.width * 0.664, y: fullScreenSize.height * 0.925)
        self.view.addSubview(myLabel)
        
        // 計時開始！
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tickDown() {
        if setTime > 0 {
            setTime -= 1
            myLabel.text = String(setTime/60) + ":" + String(format: "%02d", setTime%60)
        }
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



