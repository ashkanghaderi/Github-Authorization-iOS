import Domain
import RxSwift
public final class SearchRepositoryUseCase: Domain.SearchRepositoryUseCase {

    private let network: RepositorySearchNetwork
    
    init(network: RepositorySearchNetwork) {
        self.network = network
    }
    
    public func searchRepository(query: String) -> Observable<RepositoriesModel.Response>{
        return self.network.searchRepositories(query: query)
    }
}

