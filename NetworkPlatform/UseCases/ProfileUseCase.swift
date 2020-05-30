import Domain
import RxSwift
public final class ProfileUseCase: Domain.ProfileUseCase {
    
    
    private let network: ProfileNetwork
    
    init(network: ProfileNetwork) {
        self.network = network
    }
    
    public func saveProfile(user: UserModel) -> Observable<Bool> {
        return self.network.saveProfile(user: user)
    }
    
    public func fetchProfile(userName: String) -> Observable<UserModel> {
        return self.network.fetchProfile(userName: userName)
    }
    
}

