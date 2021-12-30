//
//  BJAlert.swift
//  BJCollection
//
//  Created by Sovannra on 30/12/21.
//

import UIKit

public struct Alert {
    private static var vc = UIAlertController()
    public static func present(title: String?, message: String, actions: Alert.Action..., from controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions {
            if action.alertAction.title != ""  {
                alertController.addAction(action.alertAction)
            }
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            dismissAlert()
        }
        alertController.addAction(cancelAction)
        controller.present(alertController, animated: true, completion: nil)
        vc = alertController
    }
    
    public static func dismissAlert(){
        vc.dismiss(animated: true, completion: nil)
    }
    
}

extension Alert {
    public enum Action {
        case reply(handler: (() -> Void)?)
        case edit(handler: (() -> Void)?)
        case delete(handler: (() -> Void)?)
        
        // Returns the title of our action button
        private var title: String {
            switch self {
            case .reply:
                return "Reply"
            case .edit:
                return "Edit"
            case .delete:
                return "Delete"
            }
        }
        
        // Returns the completion handler of our button
        private var handler: (() -> Void)? {
            switch self {
            case .reply(let handler):
                return handler
            case .edit(handler: let handler):
                return handler
            case .delete(let handler):
                return handler
            }
        }
        
        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }
}
