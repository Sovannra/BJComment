//
//  BJUILable.swift
//  BJComment
//
//  Created by Sovannra on 27/12/21.
//

import UIKit

public class BJUILabel: UILabel {

    public var padding: UIEdgeInsets

    // Create a new PaddingLabel instance programamtically with the desired insets
    public required init(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        self.padding = padding
        super.init(frame: CGRect.zero)
    }

    // Create a new PaddingLabel instance programamtically with default insets
    public override init(frame: CGRect) {
        padding = UIEdgeInsets.zero // set desired insets value according to your needs
        super.init(frame: frame)
    }

    // Create a new PaddingLabel instance from Storyboard with default insets
    required init?(coder aDecoder: NSCoder) {
        padding = UIEdgeInsets.zero // set desired insets value according to your needs
        super.init(coder: aDecoder)
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    // Override `intrinsicContentSize` property for Auto layout code
    public override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let height = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }

    // Override `sizeThatFits(_:)` method for Springs & Struts code
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        let width = superSizeThatFits.width + padding.left + padding.right
        let heigth = superSizeThatFits.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }

}
