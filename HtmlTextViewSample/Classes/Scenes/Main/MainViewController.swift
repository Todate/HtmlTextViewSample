//
//  MainViewController.swift
//  HtmlTextViewSample
//
//  Created by Daisuke Todate on 2018/11/08.
//  Copyright © 2018年 TDT Works. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var htmlTextView: HtmlTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard
            let filepath = Bundle.main.path(forResource: "sample", ofType: "txt"),
            let contents = try? String(contentsOfFile: filepath)
        else {
            return
        }
        
        htmlTextView.setHtml(contents)
    }
}

