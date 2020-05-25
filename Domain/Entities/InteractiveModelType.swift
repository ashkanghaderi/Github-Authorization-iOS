import Foundation

protocol InteractiveModelType {
  associatedtype Request
  associatedtype Response
}

public enum ResponseMessage {
  public struct Base: Codable {
    public let code: Int
//    public let status: Int
    public let message: String
  }
}
