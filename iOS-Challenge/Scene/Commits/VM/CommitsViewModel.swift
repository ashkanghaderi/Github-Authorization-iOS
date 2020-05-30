import Foundation
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

final class CommitsViewModel: ViewModelType {
    
    private let navigator: CommitsNavigator
    private let useCase: Domain.CommitsUseCase
    private(set) var commitsCount = 0
    private(set) var userName: String
    private(set) var repoName: String
    
    init(navigator: CommitsNavigator, useCase: Domain.CommitsUseCase,repoName: String,userName: String) {
        self.useCase = useCase
        self.navigator = navigator
        self.userName = userName
        self.repoName = repoName
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let commitsList =  self.useCase.fetchCommits(useName: self.userName, repoName: self.repoName).trackActivity(activityIndicator).trackError(errorTracker).asDriverOnErrorJustComplete()
        .map{ result in
            return result.compactMap({ (item) -> CommitsCellViewModel in
               return CommitsCellViewModel(with: item)
           })
           
        }
        
        let back = input.backTrigger.map { [unowned self]_ in
            self.navigator.back()
        }.mapToVoid()
        
        let profile = input.profileTrigger.map { [unowned self]_ in
            self.navigator.toProfile(canEdit: false,userName: self.userName )
        }.mapToVoid()
        
        return Output(isFetching: activityIndicator.asDriver(), commits: commitsList, error: errorTracker.asDriver(), back: back, profile: profile)
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
