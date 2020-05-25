import Foundation
import Domain
import RxCocoa
class RepositoriesNavigator {
    
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(services: UseCaseProvider, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func setup() {
        let repoVC = ReporitoriesViewController(nibName: "ReporitoriesViewController", bundle: nil)
        repoVC.viewModel = RepositoriesViewModel(navigator: self, useCase: services.makeSearchRepositoryUseCase())
        
        navigationController.viewControllers = [repoVC]
    }
    
    
    func toSelected(Option option:RepositoryCellViewModel) {
       
    }
    
    
    func toError(error: Error) {
        
    }
}
