import Foundation
public struct RepositoryItem: Codable {
    public let id: Int
    public let name: String
    public let description: String?
    public let owner: UserModel
    public let language: String?
    
}

