import Foundation
import RxSwift

public protocol ProfileUseCase {
    
    func fetchProfile(userName: String) -> Observable<UserModel>
    
    func saveProfile(user: UserModel) -> Observable<Bool>
}
