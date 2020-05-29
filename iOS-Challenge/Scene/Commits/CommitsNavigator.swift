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
    
    func setup(userName: String,repoName: String) {
        let commitVC = CommitsController(nibName: "CommitsController", bundle: nil)
        commitVC.viewModel = CommitsViewModel(navigator: self, useCase: services.makeCommitsUseCase(),userName: userName,repoName: repoName)
        
        navigationController.pushViewController(commitVC, animated: true)
    }
    
    func back(){
        navigationController.popViewController(animated: true)
    }
    
    func toProfile(){}
      
    func toError(error: Error) {
        
    }
}
