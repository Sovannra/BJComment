//
//  UIImageView+Extension.swift
//  BJComment
//
//  Created by Sovannra on 3/1/22.
//

import UIKit

public extension UIImageView {
    
    func loadGif(with url: String) {
        guard let url = URL(string: url) else { return }
        self.setGifFromURL(url)
    }
}
