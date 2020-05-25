import Foundation
public enum RepositoriesModel: InteractiveModelType {
    public struct Request: Codable {
        
    }
    
    public struct Response: Codable {
        public let repositories: [RepositoryItem]
    }
}

