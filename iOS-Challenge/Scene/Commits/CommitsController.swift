import UIKit
import RxSwift

class CommitsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 100
            tableView.customStyle()
        }
    }
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var viewModel :  CommitsViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         tableView.register(UINib(nibName: "CommitViewCell", bundle: nil), forCellReuseIdentifier: CellIds.cellId.rawValue)
               
               bindData()
    }

    private func bindData(){
              assert(viewModel != nil)
        let input = CommitsViewModel.Input(profileTrigger: self.profileBtn.rx.tap.asDriver(), backTrigger: self.backBtn.rx.tap.asDriver())
              let output = viewModel.transform(input: input)
          
           [output.commits.drive(tableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: CommitViewCell.self)){ item, viewModel, cell in
               cell.bindData(withViewModel: viewModel)
            },output.back.drive(),output.profile.drive(),output.isFetching.drive(),output.error.drive()
               ].forEach { (item) in
                   item.disposed(by: disposeBag)
           }
           
       }

}
