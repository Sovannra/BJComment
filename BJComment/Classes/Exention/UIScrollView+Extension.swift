//
//  UIScrollView+Extension.swift
//  BJComment
//
//  Created by Sovannra on 30/12/21.
//

import UIKit
import BJTextView

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        let y = contentSize.height - 1
        if #available(iOS 11.0, *) {
            let rect = CGRect(x: 0, y: y, width: 1, height: 1)
            scrollRectToVisible(rect, animated: animated)
        }
    }
}
