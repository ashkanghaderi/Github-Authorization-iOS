import Foundation
public enum CommitsModel: InteractiveModelType {
    public struct Request: Codable {
        
    }
    
    public struct Response: Codable {
        public let commits: [CommitItem]
    }
}
