import Foundation
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

final class RepositoriesViewModel: ViewModelType {
    
    private let navigator: RepositoriesNavigator
    private let useCase: Domain.SearchRepositoryUseCase
    private(set) var repositoryCount = 0
    
    init(navigator: RepositoriesNavigator, useCase: Domain.SearchRepositoryUseCase) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let repoList = input.searchQuery.asDriver().debounce(1.5).distinctUntilChanged().flatMap({(value) -> Driver<RepositoriesModel.Response> in
            return  self.useCase.searchRepository(query: value).trackActivity(activityIndicator).trackError(errorTracker).asDriverOnErrorJustComplete()
        }).map{ result in
            return result.items.compactMap({ (item) -> RepositoryCellViewModel in
               return RepositoryCellViewModel(with: item)
           })
           
        }
        
        let repositorySelect = input.repositorySelection.withLatestFrom(repoList){ [unowned self](indexPath, items) -> Void in
            let item = items[indexPath.row]
            self.navigator.toCommits(userName: item.owner.login, repoName: item.name)
        }
        
        return Output(isFetching: activityIndicator.asDriver(), repositories: repoList  , error: errorTracker.asDriver(),selectedRepository:repositorySelect )
    }
    
    
}

extension RepositoriesViewModel {
    struct Input {
        let repositorySelection: Driver<IndexPath>
        let searchQuery: Driver<String>
        let searchTrigger: Driver<Void>
    }
    
    struct Output {
        let isFetching: Driver<Bool>
        let repositories: Driver<[RepositoryCellViewModel]>
        let error: Driver<Error>
        let selectedRepository: Driver<Void>
    }
}
