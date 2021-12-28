//
//  BJPreviousReplyView.swift
//  BJComment
//
//  Created by Sovannra on 28/12/21.
//

import UIKit

public class BJPreviousReplyView: UIView {
    
    public let profileSize: CGFloat = 25
    public let fontSize: CGFloat = 13
    
    fileprivate var usernameWidthConstraint: NSLayoutConstraint?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupComponent()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent() {
        addSubview(vMainStackView)
        vMainStackView.addArrangedSubview(vViewReply)
        vMainStackView.addArrangedSubview(vStackView)
        vStackView.addArrangedSubview(vProfile)
        vStackView.addArrangedSubview(vUsername)
        vStackView.addArrangedSubview(vCaption)
    }
    
    private func setupConstraint() {
        //vMainStackView
        vMainStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        vMainStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        vMainStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        vMainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //vProfile
        vProfile.widthAnchor.constraint(equalToConstant: profileSize).isActive = true
        vProfile.heightAnchor.constraint(equalToConstant: profileSize).isActive = true
        
        //vUsername
        usernameWidthConstraint = vUsername.widthAnchor.constraint(equalToConstant: 0)
        usernameWidthConstraint?.isActive = true
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let width = vUsername.intrinsicContentSize.width
        usernameWidthConstraint?.constant = width
    }
    
    lazy var vMainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 6
        view.distribution = .fill
        view.axis = .vertical
        view.contentMode = .left
        view.clipsToBounds = true
        return view
    }()
    
    lazy var vViewReply: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "View 1 previous replies..."
        view.textColor = .black
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 4
        view.distribution = .fillProportionally
        view.axis = .horizontal
        view.contentMode = .left
        view.clipsToBounds = true
        return view
    }()
    
    lazy var vProfile: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = profileSize / 2
        return view
    }()
    
    lazy var vUsername: BJUILabel = {
        let view = BJUILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Jonh"
        view.textColor = .black
        view.font = .systemFont(ofSize: fontSize, weight: .semibold)
        return view
    }()
    
    lazy var vCaption: BJUILabel = {
        let view = BJUILabel(padding: UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello"
        view.textAlignment = .left
        view.textColor = .black
        view.font = .systemFont(ofSize: fontSize)
        view.numberOfLines = 1
        return view
    }()
}
