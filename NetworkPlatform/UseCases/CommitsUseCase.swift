import Domain
import RxSwift
public final class CommitsUseCase: Domain.CommitsUseCase {

    private let network: CommitsNetwork
    
    init(network: CommitsNetwork) {
        self.network = network
    }
    
    public func fetchCommits(useName: String,repoName: String) -> Observable<[CommitsModel]>{
        return self.network.fetchCommits(useName: useName, repoName: repoName)
    }
}

