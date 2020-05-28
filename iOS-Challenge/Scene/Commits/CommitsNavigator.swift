import Foundation
import Domain
import RxCocoa
class CommitsNavigator {
    
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(services: UseCaseProvider, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func setup() {
        let commitVC = CommitsController(nibName: "CommitsController", bundle: nil)
        commitVC.viewModel = CommitsViewModel(navigator: self, useCase: services.makeSearchRepositoryUseCase())
        
        navigationController.pushViewController(commitVC, animated: true)
    }
    
    
    func toSelected(Option option:RepositoryCellViewModel) {
       
    }
    
    
    func toError(error: Error) {
        
    }
}
