//
//  RepositoryViewCell.swift
//  iOS-Challenge
//
//  Created by Catalina on 5/25/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import UIKit

class RepositoryViewCell : UITableViewCell  {

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
    @IBOutlet weak var repoLang: UILabel!
    @IBOutlet weak var repoDesc: UILabel!
    @IBOutlet weak var repoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(withViewModel vm: RepositoryCellViewModel) {
        repoName.text = vm.name
        repoDesc.text = vm.description
        repoLang.text = vm.language
    }
    
}
