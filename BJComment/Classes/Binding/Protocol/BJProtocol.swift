//
//  BJProtocol.swift
//  BJCollection
//
//  Created by Sovannra on 29/12/21.
//

import UIKit

public protocol BJDelegate {
    func didSelect(_ type: BJActionType, _ comment: BJCommentViewModel)
    func didLongPress(_ comment: BJCommentViewModel)
}

public enum BJActionType {
    case profile
    case caption
    case reply
}
