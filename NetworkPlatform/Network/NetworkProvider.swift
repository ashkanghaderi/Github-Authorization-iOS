import Domain

final class NetworkProvider {
	private var apiEndpoint: String {
		var endpoint = Constants.EndPoints.defaultBaseUrl.rawValue
//        if let baseURL = UserDefaults.standard.string(forKey: Constants.Keys.Settings.baseURL.rawValue), !baseURL.isEmpty {
//            endpoint = baseURL
//        }
		return endpoint
	}
//    [TODO] [MOCKFLAG]
    private let mockBaseURL = "http://www.mocky.io/v2/"
	
	/*public func makeAuthorizationNetwork() -> AuthenticationNetwork {
		let network = Network<TokenModel.Response>(apiEndpoint)
        //let network = Network<TokenModel.Response>(mockBaseURL)
		return AuthenticationNetwork(network: network)
	}*/
	
	public func makeSearchRepositoryNetwork() -> RepositorySearchNetwork {
		let network = Network<RepositoriesModel.Response>(apiEndpoint)
        
		return RepositorySearchNetwork(network: network)
	}

}
