import Foundation
import RxSwift

public protocol SearchRepositoryUseCase {
  func searchRepository(query: String) -> Observable<RepositoriesModel.Response>
}
