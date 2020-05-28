import Foundation
public struct CommitItem: Codable {
    public let author: CommitActorItem
    public let committer: CommitActorItem
    public let message: String
}
