


public enum BaseURL: String {
    
    case BaseUrl = "https://api.github.com/"
    
    
}

public enum Route {
    
    case RepositoryServiceRoute(RepositoryRoute)
    case CommitServiceRoute(CommitRoute)
    case ProfileServiceRoute(ProfileRoute)
}

public enum RepositoryRoute: String {
    
    case search = "search/repositories"
    
    var path: String {
        return self.rawValue
    }
}

public enum CommitRoute: String {
    
    case commits = "repos/"
    
    
    var path: String {
        return  self.rawValue
    }
}

public enum ProfileRoute: String {
    
    case profile = "users/"
    
    
    var path: String {
        return  self.rawValue
    }
}



extension Route {
    public var url: String {
        switch self {
        case .RepositoryServiceRoute(let repoRoute):
            return repoRoute.path
            
        case .CommitServiceRoute(let commitRoute):
            return commitRoute.path
            
        case .ProfileServiceRoute(let profileRoute):
            return profileRoute.path
        }
    }
}

