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
    
    
    func toSelected(Option option:RepositoryCellViewModel) {
       
    }
    
    
    func toError(error: Error) {
        
    }
}
