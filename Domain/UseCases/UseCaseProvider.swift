import Foundation

public protocol UseCaseProvider {
    
    func makeSearchRepositoryUseCase() -> SearchRepositoryUseCase
    
    func makeCommitsUseCase() -> CommitsUseCase
    
    func makeProfileUseCase() -> ProfileUseCase
    
}
