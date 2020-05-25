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
        
      
        
        let repoList = input.searchTrigger.withLatestFrom(input.searchQuery).map { (query) in
            return query
        }.flatMapFirst({ [unowned self](query) in
            
            let result = self.useCase.searchRepository(query: query).trackActivity(activityIndicator).trackError(errorTracker).asDriverOnErrorJustComplete()
        
        let items = result.map { (response) -> [RepositoryCellViewModel] in
            return response.repositories.compactMap({ (item) -> RepositoryCellViewModel in
                return RepositoryCellViewModel(with: item)
            })
        }
            return items
        })
        
       
        
        return Output(isFetching: activityIndicator.asDriver(), repositories: repoList  , error: errorTracker.asDriver())
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
    }
}
