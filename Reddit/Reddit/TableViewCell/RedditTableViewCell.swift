//
//  RedditTableViewCell.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/25/21.
//

import UIKit
import SDWebImage

final class RedditTableViewCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(lblTitle)
        stackView.addArrangedSubview(customImageView)
        stackView.addArrangedSubview(horizontalStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var customImageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10.0
        let constraint = view.heightAnchor.constraint(equalToConstant: 200)
        constraint.isActive = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution  = .fillEqually
        stackView.addArrangedSubview(lblComment)
        stackView.addArrangedSubview(lblScore)
        let constraint = stackView.heightAnchor.constraint(equalToConstant: 30)
        constraint.isActive = true
        return stackView
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var lblComment: UILabel = {
        let lbl = UILabel()
        lbl.text = "Comments: -- "
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var lblScore: UILabel = {
        let lbl = UILabel()
        lbl.text = "Score: -- "
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFeedInformation(childData: ChildData) {
        if let title: String = childData.title {
            lblTitle.text = title
        }
        if let score: Int = childData.score {
            lblScore.text = "Score: \(score)"
        }
        if let numComments: Int = childData.numComments {
            lblComment.text = "Comments: \(numComments)"
        }
        setImageData(childData: childData)
    }
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                customImageView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                customImageView.addConstraint(aspectConstraint!)
            }
            
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }

    private func setImageData(childData: ChildData) {
        if let thumbnail: String = childData.thumbnail,
           let thumbnailWidth: Int = childData.thumbnailWidth,
           let thumbnailHeight: Int = childData.thumbnailHeight,
           let imageURL: URL = URL(string: thumbnail) {
            let aspectRatio = CGFloat(thumbnailWidth) / CGFloat(thumbnailHeight)
            let constraint = NSLayoutConstraint(item: customImageView,
                                                attribute: NSLayoutConstraint.Attribute.width,
                                                relatedBy: NSLayoutConstraint.Relation.equal,
                                                toItem: customImageView,
                                                attribute: NSLayoutConstraint.Attribute.height,
                                                multiplier: aspectRatio,
                                                constant: 0.0)
            constraint.priority = UILayoutPriority(rawValue: 999)
            aspectConstraint = constraint
            customImageView.sd_setImage(with: imageURL)
        } else {
            stackView.updateConstraints()
        }
    }
}
