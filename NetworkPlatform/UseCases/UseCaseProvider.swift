import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    
    private let networkProvider: NetworkProvider

    public init() {
        networkProvider = NetworkProvider()
    }
 
    public func makeSearchRepositoryUseCase() -> Domain.SearchRepositoryUseCase {
        return SearchRepositoryUseCase(network: networkProvider.makeSearchRepositoryNetwork())
    }
    
    public func makeCommitsUseCase() -> Domain.CommitsUseCase {
        return CommitsUseCase(network: networkProvider.makeCommitsNetwork())
    }
    
    
}
