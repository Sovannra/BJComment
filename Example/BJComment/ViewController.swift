//
//  ViewController.swift
//  BJComment
//
//  Created by Sovannra on 12/27/2021.
//  Copyright (c) 2021 Sovannra. All rights reserved.
//

import UIKit
import BJComment
import BJTextView

class ViewController: UIViewController, BJDelegate {
    
    /** User owner Id */
    var ownerId: String = "3"
    
    lazy var vComment: BJCommentView = {
        let view = BJCommentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    /// Declare bottom NSLayoutConstraint to popup & dimiss textView with animation
    var bottomConstraint: NSLayoutConstraint?
    
    /// To declare comment textView
    lazy var vTextView: BJCommentTextView = {
        let view = BJCommentTextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    /// Popup keyboard when view appear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.endEditing(true)
        vTextView.dismissKeyboard()
    }
    
    /// Dimiss keyboard when view disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        vTextView.dismissKeyboard()
    }
    
    deinit {
        deregisterFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Comment"
        setupView()
        
        LocalData.loadData { [self] comment in
            vComment.comment = comment
            vComment.vTableView.reloadData()
        }
    }
    
    func setupView() {
        view.addSubview(vComment)
        view.addSubview(vTextView)
        
        //vComment
        vComment.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        vComment.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        vComment.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        vComment.bottomAnchor.constraint(equalTo: vTextView.topAnchor).isActive = true
        
        //vTextView
        vTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        vTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomConstraint = vTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomConstraint?.isActive = true
    }

    func didSelect(_ type: BJActionType, _ comment: BJCommentViewModel) {
        switch type {
        case .profile:
            /// Do something
            break
        case .caption:
            /// Do something
            break
        case .reply:
            /// Do something
            break
        }
    }
    
    func didLongPress(_ comment: BJCommentViewModel) {
        vTextView.dismissKeyboard()
        if comment.ownerId == ownerId {
            ownerAction(comment)
        } else {
            friendAction(comment)
        }
    }
    
    /** Action sheet owner comment */
    func ownerAction(_ comment: BJCommentViewModel) {
        switch comment.longGestureType {
        /// Long press on caption
        case .caption:
            Alert.present(title: "Action Sheet",
                          message: "What would you like to do?",
                          actions:
                                .reply(handler: {print("reply")}),
                                .edit(handler: {self.editComment(comment)}),
                                .delete(handler: {self.deleteRow(comment.indexPath)}),
                          from: self)
        /// Long press on image
        case .image:
            Alert.present(title: "Action Sheet",
                          message: "What would you like to do?",
                          actions:
                                .reply(handler: {print("reply")}),
                                .delete(handler: {self.deleteImage(comment)}),
                          from: self)
        }
    }
    
    /** Action sheet friend's comment */
    func friendAction(_ comment: BJCommentViewModel) {
        Alert.present(title: "Action Sheet",
                      message: "What would you like to do?",
                      actions: .reply(handler: {print("reply")}),
                      from: self)
    }
    
    /** Edit comment */
    func editComment(_ comment: BJCommentViewModel) {
        let data = BJCommentModel(commentId: comment.commentId,
                                  image: comment.imageView,
                                  imageUrl: comment.imageUrl,
                                  stickerId: comment.stickerId,
                                  text: comment.caption,
                                  type: BJCommentTextType(rawValue: comment.commentType),
                                  indexPath: comment.indexPath?.row,
                                  createdAt: comment.createdAt)
        vComment.reply = comment.comment.reply
        vTextView.updateComment(data)
    }
    
    /** Delete comment */
    func deleteRow(_ indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        vComment.deleteRow(indexPath)
    }
    
    /** Delete only image from comment */
    func deleteImage(_ comment: BJCommentViewModel) {
        guard let indexPath = comment.indexPath else { return }
        guard var newComment = comment.comment else { return }
        if comment.caption != "" {
            newComment.imageUrl = ""
            vComment.updateRow(newComment, indexPath.row)
        } else {
            vComment.deleteRow(indexPath)
        }
    }
}

extension ViewController {
    /// Handle click outsize to dismiss keyboard
    @objc func handleTap() {
        view.endEditing(true)
        vTextView.resetSticker()
    }
    
    /// Handle keyboard notification to popup commentTextView
    @objc func handleKeyBoardNotification(notification: Notification) {
        if notification.name == NSNotification.Name.UIKeyboardWillShow {
            vTextView.resetSticker()
        }
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        {
            let isKeyboardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            bottomConstraint?.constant = isKeyboardShowing ? -(keyboardSize.height - view.safeAreaInsets.bottom): 0
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut) {
                self.view.layoutIfNeeded()
            } completion: { completed in }
        }
    }
    
    /// Register keyboard notification
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    /// Unregister from keyboard notification
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
}

extension ViewController: BJCommentDelegate {

    func sendComment(_ comment: BJCommentModel) {
        vComment.reply = []
        let data = mapComment(comment)
        vComment.insertRow(data)
    }
    
    func updateComment(_ comment: BJCommentModel) {
        let data = mapComment(comment)
        vComment.updateRow(data, comment.indexPath)
        vComment.reply = []
    }
    
    func didSelectSticker(_ isSelected: Bool) {
        
    }
    
    /** Map model comment from BJTextView to BJComment list */
    func mapComment(_ comment: BJCommentModel) -> BJCommentListModel {
        let data = BJCommentListModel(id: comment.commentId, user: BJUser(id: "3", username: "Sovannra Kong", imageUrl: "https://images.unsplash.com/photo-1594751543129-6701ad444259?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFyayUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80"),
                                      caption: comment.text,
                                      imageUrl: comment.imageUrl,
                                      stickerId: comment.stickerId,
                                      createdAt: comment.createdAt,
                                      type: BJCommentType.init(rawValue: comment.type.rawValue) ?? .caption,
                                      reply: vComment.reply,
                                      aspectRatioType: .landscape)
        return data
    }
}
