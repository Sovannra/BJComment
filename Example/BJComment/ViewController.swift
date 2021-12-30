//
//  ViewController.swift
//  BJComment
//
//  Created by Sovannra on 12/27/2021.
//  Copyright (c) 2021 Sovannra. All rights reserved.
//

import UIKit
import BJComment

class ViewController: UIViewController, BJDelegate {
    
    lazy var vComment: BJCommentView = {
        let view = BJCommentView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Comment"
        view.addSubview(vComment)
        vComment.fillSuperview()
        
        LocalData.loadData { [self] comment in
            vComment.comment = comment
            vComment.vCollection.reloadData()
        }
    }

    func didSelect(_ type: BJActionType, _ comment: BJCommentViewModel) {
        print("Type => \(type)")
    }
    
    func didLongPress(_ comment: BJCommentViewModel) {
        if comment.ownerId == "3" {
            ownerAction(comment)
        } else {
            friendAction(comment)
        }
    }
    
    func ownerAction(_ comment: BJCommentViewModel) {
        Alert.present(title: "Action Sheet",
                      message: "What would you like to do?",
                      actions:
                            .reply(handler: {print("reply")}),
                            .edit(handler: {print("edit")}),
                      .delete(handler: {self.deleteRow(comment.indexPath)}),
                      from: self)
    }
    
    func friendAction(_ comment: BJCommentViewModel) {
        Alert.present(title: "Action Sheet",
                      message: "What would you like to do?",
                      actions: .reply(handler: {print("reply")}),
                      from: self)
    }
    
    func deleteRow(_ indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
//        vComment.comment?.remove(at: indexPath.row)
        vComment.deleteRow(indexPath)
    }
}

