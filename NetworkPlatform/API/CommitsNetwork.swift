import Foundation

import Domain
import RxSwift

public final class CommitsNetwork {
    
    private let network: Network<[CommitsModel]>
    
    init(network: Network<[CommitsModel]>) {
        self.network = network
    }
    
    public func fetchCommits(useName: String,repoName: String) -> Observable<[CommitsModel]>{

        let url = Route.CommitServiceRoute(.commits).url  + useName + "/" + repoName + "/commits"
        return network.getItem(url)
    }
    
}
