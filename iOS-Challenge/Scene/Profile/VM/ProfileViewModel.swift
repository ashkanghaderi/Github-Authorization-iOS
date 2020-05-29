import Foundation
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

final class ProfileViewModel: ViewModelType {
    
    private let navigator: ProfileNavigator
    private let useCase: Domain.ProfileUseCase
    private(set) var owner : UserModel
    
    init(navigator: ProfileNavigator, useCase: Domain.ProfileUseCase,owner: UserModel) {
        self.useCase = useCase
        self.navigator = navigator
        self.owner = useownerrName
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let back = input.backTrigger.map { [unowned self]_ in
            self.navigator.back()
        }.mapToVoid()
        
        let edit = input.editTrigger.map { [unowned self]_ in
            self.navigator.back()
        }.mapToVoid()
        
        return Output(isFetching: activityIndicator.asDriver(), Profile: self.owner, error: errorTracker.asDriver(), back: back, edit: edit)
    }
    
    
}

extension ProfileViewModel {
    struct Input {
        let editTrigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    
    struct Output {
        let isFetching: Driver<Bool>
        let profile: Driver<UserModel>
        let error: Driver<Error>
        let back: Driver<Void>
        let edit: Driver<Void>
    }
}
