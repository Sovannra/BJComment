//
//  ViewController.swift
//  BJComment
//
//  Created by Sovannra on 12/27/2021.
//  Copyright (c) 2021 Sovannra. All rights reserved.
//

import UIKit
import BJComment

class ViewController: UIViewController {

    let vComment: BJCommentView = {
        let view = BJCommentView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Comment"
        view.addSubview(vComment)
        vComment.fillSuperview()
    }

}

