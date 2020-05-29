import Foundation
import RxSwift

public protocol ProfileUseCase {
    func fetchProfile(useName: String) -> Observable<UserModel>
}
