//
//  eggrollController.swift
//  test
//
//  Created by 馮謙 on 2018/2/19.
//  Copyright © 2018年 馮謙. All rights reserved.
//

import UIKit

class eggrollController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 建立背景圖片
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
        myImageView.image = UIImage(named: "NTD1eggroll.jpg")
        myImageView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(myImageView)
        
        // 建立提示框
        var myButton = UIButton(type: .system)
        myButton.frame = CGRect(
            x: 0, y: 0, width: 375, height: 50)
        myButton.backgroundColor = UIColor.clear
        myButton.addTarget(
            nil,
            action: #selector(confirm),
            for: .touchUpInside)
        myButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.95)
        self.view.addSubview(myButton)
        
        // 建立返回鍵
        myButton = UIButton(type: .system)
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
    }

    @objc func confirm() {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "確認兌換優惠",
            message: "請確認您已在麥當勞櫃檯，點選「立即兌換」後，需於兩分鐘內出示給結帳人員",
            preferredStyle: .alert)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "暫不兌換",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[送出]按鈕
        let okAction = UIAlertAction(
            title: "立即兌換",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                self.present(eggrollTimeController(), animated: false, completion: nil)
        })
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
        
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
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
