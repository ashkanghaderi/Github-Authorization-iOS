import Foundation
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

final class CommitsViewModel: ViewModelType {
    
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
        
        let repoList =  self.useCase.searchRepository(query: value).trackActivity(activityIndicator).trackError(errorTracker).asDriverOnErrorJustComplete()
        .map{ result in
            return result.items.compactMap({ (item) -> RepositoryCellViewModel in
               return RepositoryCellViewModel(with: item)
           })
           
        }
        
        return Output(isFetching: activityIndicator.asDriver(), repositories: repoList  , error: errorTracker.asDriver())
    }
    
    
}

extension CommitsViewModel {
    struct Input {
        let profileTrigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    
    struct Output {
        let isFetching: Driver<Bool>
        let commits: Driver<[CommitsCellViewModel]>
        let error: Driver<Error>
        let back: Driver<Void>
        let profile: Driver<Void>
    }
}
