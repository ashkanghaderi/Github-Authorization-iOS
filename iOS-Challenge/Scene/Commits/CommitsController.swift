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

         tableView.register(UINib(nibName: "RepositoryViewCell", bundle: nil), forCellReuseIdentifier: CellIds.cellId.rawValue)
               
               bindData()
    }

    private func bindData(){
              assert(viewModel != nil)
           let input = RepositoriesViewModel.Input(repositorySelection: tableView.rx.itemSelected.asDriver(), searchQuery: searchBar.rx.text.orEmpty.asDriver(),searchTrigger: searchBar.rx.textDidBeginEditing.asDriver())
              let output = viewModel.transform(input: input)
          
           [output.repositories.drive(tableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: RepositoryViewCell.self)){ item, viewModel, cell in
               cell.bindData(withViewModel: viewModel)
               }
               ].forEach { (item) in
                   item.disposed(by: disposeBag)
           }
           
       }

}
