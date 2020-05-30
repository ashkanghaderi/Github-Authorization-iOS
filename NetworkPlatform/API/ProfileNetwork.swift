import Foundation

import Domain
import RxSwift

public final class ProfileNetwork {
    
    private let network: Network<UserModel>
    
    init(network: Network<UserModel>) {
        self.network = network
    }
    
    public func saveProfile(user: UserModel) -> Observable<Bool>{
        
        return Observable.just(true)
    }
    
    public func fetchProfile(userName: String) -> Observable<UserModel>{
        let url = Route.ProfileServiceRoute(.profile).url  + userName
        return network.getItem(url)
    }
    
}
