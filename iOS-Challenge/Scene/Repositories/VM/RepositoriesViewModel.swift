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
    }
    
    
}

extension RepositoriesViewModel {
    struct Input {
        let repositorySelection: Driver<IndexPath>
        let searchTrigger: Driver<Void>
        let searchQuery: Driver<String>
    }
    
    struct Output {
        let isFetching: Driver<Bool>
        let repositories: Driver<[RepositoryCellViewModel]>
        let error: Driver<Error>
        let action: Driver<Void>
    }
}
