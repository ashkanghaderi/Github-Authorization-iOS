import Foundation
import Domain
import RxCocoa
class ProfileNavigator {
    
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(services: UseCaseProvider, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func setup(userName: String,repoName: String) {
        let profileVC = ProfileController(nibName: "ProfileController", bundle: nil)
        profileVC.viewModel = ProfileViewModel(navigator: self, useCase: services.makeProfileUseCase(),userName: userName)
        
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func back(){
        navigationController.popViewController(animated: true)
    }
      
    func toError(error: Error) {
        
    }
}
