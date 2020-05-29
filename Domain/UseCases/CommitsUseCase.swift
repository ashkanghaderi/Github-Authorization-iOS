import Foundation
import RxSwift

public protocol CommitsUseCase {
    func fetchCommits(useName: String,repoName: String) -> Observable<[CommitsModel]>
}
