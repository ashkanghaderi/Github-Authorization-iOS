import UIKit
import RxSwift

class ReporitoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel :  RepositoriesViewModel!
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
       
        [output.repositories.drive(tableView.rx.items(cellIdentifier: "RepositoryViewCell", cellType: RepositoryViewCell.self)){ item, viewModel, cell in
            cell.bindData(withViewModel: viewModel)
            }
            ].forEach { (item) in
                item.disposed(by: disposeBag)
        }
        
    }
    

}
