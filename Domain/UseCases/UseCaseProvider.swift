import Foundation

public protocol UseCaseProvider {
    
    func makeSearchRepositoryUseCase() -> SearchRepositoryUseCase
    
}
