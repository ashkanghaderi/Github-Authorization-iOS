import Foundation
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

final class ProfileViewModel: ViewModelType {
    
    private let navigator: ProfileNavigator
    private let useCase: Domain.ProfileUseCase
    private(set) var userName : String
    private(set) var canEdit : Bool
    
    init(navigator: ProfileNavigator, useCase: Domain.ProfileUseCase,userName: String,canEdit: Bool) {
        self.useCase = useCase
        self.navigator = navigator
        self.userName = userName
        self.canEdit = canEdit
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let owner =  self.useCase.fetchProfile(userName: self.userName).trackActivity(activityIndicator).trackError(errorTracker).asDriverOnErrorJustComplete()
        
        
        let back = input.backTrigger.map { [unowned self]_ in
            self.navigator.back()
        }.mapToVoid()
        
        let save = input.saveTrigger.map { [unowned self]_ in
            // save profile 
        }.mapToVoid()
        
        let canEdit = self.canEdit
       
        let nameValue = owner.map { (response) -> String in
            return (response.name ?? "")
        }
        let avatarUrlValue = owner.map { (response) -> String in
            return (response.avatar_url ?? "")
        }
        let emailValue = owner.map { (response) -> String in
            return (response.email ?? "")
        }
        let locationValue = owner.map { (response) -> String in
            return (response.location ?? "")
        }
        let bioValue = owner.map { (response) -> String in
            return (response.bio ?? "")
        }
       
        let isEditableValue = Driver.just(canEdit)
        
        return Output(isFetching: activityIndicator.asDriver(), name: nameValue.asDriver(),avatarUrl : avatarUrlValue.asDriver() ,email: emailValue.asDriver(), location: locationValue.asDriver(),bio: bioValue.asDriver(),isEditable: isEditableValue, error: errorTracker.asDriver(), back: back,save: save)
    }
    
    
}

extension ProfileViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let saveTrigger: Driver<Void>
    }
    
    struct Output {
        let isFetching: Driver<Bool>
        let name: Driver<String>
        let avatarUrl: Driver<String>
        let email: Driver<String>
        let location: Driver<String>
        let bio: Driver<String>
        let isEditable: Driver<Bool>
        let error: Driver<Error>
        let back: Driver<Void>
        let save: Driver<Void>
    }
}
