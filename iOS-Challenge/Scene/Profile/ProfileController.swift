//
//  ProfileController.swift
//  iOS-Challenge
//
//  Created by Catalina on 5/29/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class ProfileController: UIViewController {
    
    @IBOutlet weak var userAvatar: UIImageView!{
        didSet{
            userAvatar.makeRounded()
        }
    }
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var bioTxt: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    
    var viewModel :  ProfileViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
    }
    
    private func bindData(){
        assert(viewModel != nil)
        let input = ProfileViewModel.Input(backTrigger: self.backBtn.rx.tap.asDriver(), saveTrigger: self.saveBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        [output.back.drive(),
         output.save.drive(),
         output.isFetching.drive(),
         output.error.drive(),
         output.avatarUrl.asDriver().do(onNext: { [unowned self](url) in
            self.userAvatar.image = UIImage(named : "placeholder")
            if let url = URL(string: url) {
                self.userAvatar.kf.setImage(with: url)
            }
         }).drive(),
         output.name.drive(nameTxt.rx.text.orEmpty),
         output.location.drive(locationTxt.rx.text.orEmpty),
         output.email.drive(emailTxt.rx.text.orEmpty),
         output.bio.drive(bioTxt.rx.text.orEmpty),
         output.isEditable.drive(saveBtn.rx.isEnabled),
         output.isEditable.drive(nameTxt.rx.isEnabled),
         output.isEditable.drive(emailTxt.rx.isEnabled),
         output.isEditable.drive(bioTxt.rx.isUserInteractionEnabled),
         output.isEditable.drive(locationTxt.rx.isEnabled)
            ].forEach { (item) in
                item.disposed(by: disposeBag)
        }
        
    }
    
}
