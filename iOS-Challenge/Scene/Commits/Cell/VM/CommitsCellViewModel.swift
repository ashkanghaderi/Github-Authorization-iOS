import Foundation
import Domain
public struct CommitsCellViewModel {
    let authorName: String
    let authorEmail: String
    let authorDate: String
    let committerName: String
    let committerEmail: String
    let committerDate: String
    let message: String

    public init(with response: CommitItem){
        self.authorName = response.author.name
        self.authorEmail = response.author.email
        self.authorDate = response.author.date
        self.committerName = response.committer.name
        self.committerEmail = response.committer.email
        self.committerDate = response.committer.date
        self.message = response.message
        
        
    }
}
