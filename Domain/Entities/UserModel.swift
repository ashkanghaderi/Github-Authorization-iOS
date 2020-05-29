import Foundation
public struct UserModel: Codable {
    public let id: Int
    public let avatar_url: String?
    public let login: String
    public let name: String?
    public let email: String?
    public let bio: String?
    public let location: String?
}
