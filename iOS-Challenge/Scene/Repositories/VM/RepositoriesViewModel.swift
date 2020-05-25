import Foundation
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

final class RepositoriesViewModel: ViewModelType {
    
    private let navigator: RepositoriesNavigator
    private let useCase: Domain.SearchRepositoryUseCase
    private(set) var repositoryCount = 0
    private var repoList : Driver<[RepositoryCellViewModel]>?
    init(navigator: RepositoriesNavigator, useCase: Domain.SearchRepositoryUseCase) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        input.searchQuery.asObservable().debounce(.zero, scheduler: MainScheduler.instance).distinctUntilChanged().subscribe(onNext: { [unowned self](query) in
            let result = self.useCase.searchRepository(query: query).trackActivity(activityIndicator).trackError(errorTracker).asDriverOnErrorJustComplete()
            
            let items = result.map { (response) -> [RepositoryCellViewModel] in
                return response.repositories.compactMap({ (item) -> RepositoryCellViewModel in
                    return RepositoryCellViewModel(with: item)
                })
            }
            
            self.repoList = items
        })
        
        return Output(isFetching: activityIndicator.asDriver(), repositories: self.repoList! , error: errorTracker.asDriver())
    }
    
    
}

extension RepositoriesViewModel {
    struct Input {
        let repositorySelection: Driver<IndexPath>
        let searchQuery: Driver<String>
    }
    
    struct Output {
        let isFetching: Driver<Bool>
        let repositories: Driver<[RepositoryCellViewModel]>
        let error: Driver<Error>
    }
}
