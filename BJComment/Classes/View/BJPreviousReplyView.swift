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
        vMainStackView.addArrangedSubview(vContainer)
        vContainer.addSubview(vProfile)
        vContainer.addSubview(vUsername)
        vContainer.addSubview(vCaption)
    }
    
    private func setupConstraint() {
        //vMainStackView
        vMainStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        vMainStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        vMainStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        vMainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //vProfile
        vProfile.topAnchor.constraint(equalTo: vContainer.topAnchor).isActive = true
        vProfile.leftAnchor.constraint(equalTo: vContainer.leftAnchor).isActive = true
        vProfile.bottomAnchor.constraint(equalTo: vContainer.bottomAnchor).isActive = true
        vProfile.widthAnchor.constraint(equalToConstant: profileSize).isActive = true
        vProfile.heightAnchor.constraint(equalToConstant: profileSize).isActive = true
        
        //vUsername
        vUsername.centerYAnchor.constraint(equalTo: vProfile.centerYAnchor).isActive = true
        vUsername.leftAnchor.constraint(equalTo: vProfile.rightAnchor, constant: 6).isActive = true
        
        //vCaption
        vCaption.centerYAnchor.constraint(equalTo: vUsername.centerYAnchor).isActive = true
        vCaption.leftAnchor.constraint(equalTo: vUsername.rightAnchor, constant: 6).isActive = true
        
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
    
    lazy var vContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        let view = BJUILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello"
        view.textAlignment = .left
        view.textColor = .black
        view.font = .systemFont(ofSize: fontSize)
        view.numberOfLines = 1
        return view
    }()
}
