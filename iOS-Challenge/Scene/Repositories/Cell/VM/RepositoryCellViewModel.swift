import Foundation
import Domain
public struct RepositoryCellViewModel {
    let id: Int
    let name: String
    let description: String
    let owner: UserModel
    let language: String

    public init(with response: RepositoryItem){
        self.id = response.id
        self.name = response.name
        self.description = response.description ?? ""
        self.language = response.language ?? ""
        self.owner = response.owner
        
    }
}
