import Domain

final class NetworkProvider {
	private var apiEndpoint: String {
        let endpoint = BaseURL.BaseUrl.rawValue

		return endpoint
	}
	
	public func makeSearchRepositoryNetwork() -> RepositorySearchNetwork {
		let network = Network<RepositoriesModel.Response>(apiEndpoint)
        
		return RepositorySearchNetwork(network: network)
	}

}
