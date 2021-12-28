//
//  CollectionController.swift
//  BJComment_Example
//
//  Created by Sovannra on 28/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import BJComment

class CollectionController: UICollectionViewController {
    
    let data = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "Lorem ipsum dolor."]
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MyCell
        cell.caption = data[indexPath.item]
        return cell
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
        layout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}

class MyCell: UICollectionViewCell {
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    let profileSize: CGFloat = 30
    let usernameFontSize: UIFont = .systemFont(ofSize: 14, weight: .semibold)
    let usernameTextColor: UIColor = .black
    let timeFontSize: UIFont = .systemFont(ofSize: 12)
    let timeTextColor: UIColor =  #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) //#999999
    let captionFontSize: UIFont = .systemFont(ofSize: 14)
    let captionTextColor: UIColor = .black
    
    var caption: String? {
        didSet {
            vCaption.text = caption
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.red
//        setupViews()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    fileprivate func setupViews() {
        contentView.addSubview(vProfile)
        vProfile.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        vProfile.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        vProfile.widthAnchor.constraint(equalToConstant: profileSize).isActive = true
        vProfile.heightAnchor.constraint(equalToConstant: profileSize).isActive = true
        
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: vProfile.leftAnchor, constant: 10).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(customView)
        customView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        customView.leftAnchor.constraint(equalTo: label.leftAnchor).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        customView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customView: UIView = {
        let customView = UIView()
        customView.backgroundColor = .green
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
    
    private func setupComponent() {
        contentView.addSubview(vProfile)
        contentView.addSubview(vStackView)
        vStackView.addArrangedSubview(vUsername)
        vStackView.addArrangedSubview(vCaption)
        contentView.addSubview(vImage)
        contentView.addSubview(vTime)
        contentView.addSubview(vReply)
    }
    
    private func setupConstraint() {
        //vProfile
        contentView.addSubview(vProfile)
        vProfile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        vProfile.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        vProfile.widthAnchor.constraint(equalToConstant: 30).isActive = true
        vProfile.heightAnchor.constraint(equalToConstant: profileSize).isActive = true
        
        //vContainer
        contentView.addSubview(vStackView)
        vStackView.addArrangedSubview(vUsername)
        vStackView.addArrangedSubview(vCaption)
        vStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        vStackView.leftAnchor.constraint(equalTo: vProfile.rightAnchor, constant: 10).isActive = true
        vStackView.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -10).isActive = true
        
        //vImage
        contentView.addSubview(vImage)
        vImage.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 10).isActive = true
        vImage.leftAnchor.constraint(equalTo: vStackView.leftAnchor).isActive = true
        vImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85).isActive = true
        vImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //vTime
        contentView.addSubview(vTime)
        vTime.topAnchor.constraint(equalTo: vImage.bottomAnchor, constant: 10).isActive = true
        vTime.leftAnchor.constraint(equalTo: vStackView.leftAnchor).isActive = true
        
        vReply
        contentView.addSubview(vReply)
        vReply.leftAnchor.constraint(equalTo: vTime.rightAnchor, constant: 10).isActive = true
        vReply.centerYAnchor.constraint(equalTo: vTime.centerYAnchor).isActive = true
        vReply.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        vReply.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
    }
    
    lazy var vProfile: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = profileSize / 2
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 6
        view.distribution = .fill
        view.axis = .vertical
        view.contentMode = .left
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 14
        view.backgroundColor =  #colorLiteral(red: 0.9411764706, green: 0.9490196078, blue: 0.9607843137, alpha: 1) //#F0F2F5
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    
    lazy var vUsername: BJUILabel = {
        let view = BJUILabel(padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Sovannra Kong"
        view.textColor = usernameTextColor
        view.font = usernameFontSize
        return view
    }()
    
    lazy var vCaption: BJUILabel = {
        let view = BJUILabel(padding: UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "I'm looking to set the left inset/margin of a UILabel and can't find a method to do so. The label has a background set so just changing its origin won't do the trick. It would be ideal to inset the text by 10px or so on the left hand side."
        view.textColor = captionTextColor
        view.font = captionFontSize
        view.numberOfLines = 0
        return view
    }()
    
    lazy var vImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 14
        return view
    }()
    
    lazy var vTime: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "1 minute ago"
        view.textColor = timeTextColor
        view.font = timeFontSize
        return view
    }()
    
    lazy var vReply: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Reply", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        return view
    }()
    
}
