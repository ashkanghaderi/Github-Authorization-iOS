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
    
    func setup(repoName: String,userName: String) {
        let commitVC = CommitsController(nibName: "CommitsController", bundle: nil)
        commitVC.viewModel = CommitsViewModel(navigator: self, useCase: services.makeCommitsUseCase(),repoName: repoName,userName: userName)
        
        navigationController.pushViewController(commitVC, animated: true)
    }
    
    func back(){
        navigationController.popViewController(animated: true)
    }
    
    func toProfile(canEdit: Bool,userName: String){
        ProfileNavigator(services: services, navigationController: navigationController).setup(canEdit: canEdit, userName: userName)
    }
      
    func toError(error: Error) {
        
    }
}
