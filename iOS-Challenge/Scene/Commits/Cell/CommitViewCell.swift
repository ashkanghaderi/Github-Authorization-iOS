//
//  CommitViewCell.swift
//  iOS-Challenge
//
//  Created by Catalina on 5/28/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import UIKit

class CommitViewCell: UITableViewCell {
    @IBOutlet weak var committerDate: UILabel!
    @IBOutlet weak var committerName: UILabel!
    @IBOutlet weak var committerEmail: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var authorEmail: UILabel!
    @IBOutlet weak var authorDate: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var clipingView: UIView!{
        didSet {
            
            clipingView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var containerView: UIView!{
        didSet {
            
            containerView.layer.shadowOpacity = 1
            containerView.layer.shadowRadius = 2
            containerView.layer.shadowColor = UIColor.lightGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(withViewModel vm: CommitsCellViewModel) {
        authorName.text = vm.authorName
        authorEmail.text = vm.authorEmail
        authorDate.text = vm.authorDate
        committerName.text = vm.committerName
        committerEmail.text = vm.committerEmail
        committerDate.text = vm.committerDate
        msgLabel.text = vm.message
    }
    
}
