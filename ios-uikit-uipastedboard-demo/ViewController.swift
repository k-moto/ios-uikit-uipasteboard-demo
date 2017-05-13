//
//  ViewController.swift
//  ios-uikit-uipastedboard-demo
//
//  Created by Kushida　Eiji on 2017/02/22.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pasteboard: UIPasteboard?
    var otherPasteboard: UIPasteboard?
    
    struct PasteBoardKey {
        static let text = "public.text"
        static let img = "public.image"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        otherBoardSetup(boardID: "other")
    }
    
    /// ボタンを押下すると、クリップボードにコピーする
    @IBAction func didTapClipBoard(_ sender: UIButton) {
        copyText(text: "テストです。")
        print("count: \(pasteboard?.changeCount)")
    }
    
    /// ボタンを押下すると、クリップボードにコピーされた文字列をペーストする
    @IBAction func didTapPast(_ sender: UIButton) {
        pastText()
    }
    
    @IBAction func didTapOtherClipBoard(_ sender: UIButton) {
        otherCopyText(text: "別のクリップボードです。")
        print("count: \(otherPasteboard?.changeCount)")
    }
    
    @IBAction func didTapOtherPast(_ sender: UIButton) {
        otherPastText()
    }
    

    /// クリップボードのインスタンスを生成する
    private func setup() {
        pasteboard = UIPasteboard.general
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                         selector: #selector(onCopy),
                         name:NSNotification.Name.UIPasteboardChanged,
                         object: nil)
    }
    
    //
    private func otherBoardSetup(boardID: String){
        otherPasteboard = UIPasteboard(name: UIPasteboardName(rawValue: boardID), create: true)
        otherPasteboard?.setValue("sonota", forPasteboardType: PasteBoardKey.text)
    }
    
    ///　文字列をコピーする
    private func copyText(text: String) {
        pasteboard?.setValue(text, forPasteboardType: PasteBoardKey.text)
    }
    
    /// 文字列をペーストする
    private func pastText() {
        let text = pasteboard?.value(forPasteboardType: PasteBoardKey.text) as! String
        print(text)

    }
    
    
    ///　他のクリップボードに文字列をコピーする
    private func otherCopyText(text: String) {
        otherPasteboard?.setValue(text, forPasteboardType: PasteBoardKey.text)
    }
    
    /// 他のクリップボードに文字列をペーストする
    private func otherPastText() {
        let text = otherPasteboard?.value(forPasteboardType: PasteBoardKey.text) as! String
        print(text)
        
    }
    
    ///　画像をコピーする
    private func copyImage(img: UIImage) {
        pasteboard?.setValue(img, forPasteboardType: PasteBoardKey.img)
    }
    
    /// 画像をペーストする
    private func pastImage() {
        let img = pasteboard?.value(forPasteboardType: PasteBoardKey.img) as! UIImage
        print(img)
    }
    
    // ペーストボードが変更されたときに呼ばれる
    @objc private func onCopy(){
        print("UIPasteboardChanged")
    }
}

