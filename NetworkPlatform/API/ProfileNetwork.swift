import Foundation

import Domain
import RxSwift

public final class ProfileNetwork {
    
    private let network: Network<UserModel>
    
    init(network: Network<UserModel>) {
        self.network = network
    }
    
   /* public func fetchProfile(useName: String,repoName: String) -> Observable<[CommitsModel]>{

        let url = Route.CommitServiceRoute(.commits).url  + useName + "/" + repoName + "/commits"
        return network.getItem(url)
    }*/
    
}
