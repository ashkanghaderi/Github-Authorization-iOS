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

    public init(with response: CommitsModel){
        self.authorName = response.commit.author.name
        self.authorEmail = response.commit.author.email
        self.authorDate = response.commit.author.date
        self.committerName = response.commit.committer.name
        self.committerEmail = response.commit.committer.email
        self.committerDate = response.commit.committer.date
        self.message = response.commit.message
        
        
    }
}
