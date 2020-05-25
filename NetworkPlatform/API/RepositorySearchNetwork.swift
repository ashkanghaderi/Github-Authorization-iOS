import Foundation

import Domain
import RxSwift

public final class RepositorySearchNetwork {
    
    private let network: Network<RepositoriesModel.Response>
    
    init(network: Network<RepositoriesModel.Response>) {
        self.network = network
    }
    
    public func searchRepositories(query:String) -> Observable<RepositoriesModel.Response>{

        let url = Constants.EndPoints.search.rawValue + "?" + query
        return network.getItem(url)
    }
    
}
