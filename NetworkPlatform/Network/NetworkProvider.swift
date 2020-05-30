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
    
    public func makeCommitsNetwork() -> CommitsNetwork {
        let network = Network<[CommitsModel]>(apiEndpoint)
        
        return CommitsNetwork(network: network)
    }
    
    public func makeProfileNetwork() -> ProfileNetwork {
        let network = Network<UserModel>(apiEndpoint)
        
        return ProfileNetwork(network: network)
    }


}
