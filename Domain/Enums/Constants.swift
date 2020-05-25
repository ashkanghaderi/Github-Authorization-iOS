import CoreTelephony
import Reachability
public enum Constants {
   
    public enum EndPoints: String {
        
        //Main
        case defaultBaseUrl = "https://api.github.com/"
        
        
        case users = "users/"
        case commits = "repos/commits/"
        case search = "search/repositories"
        
    }
    
    public enum Info {
        public static let osType = "iOS"
        public static let osVersion = { return UIDevice.current.systemVersion}
        public static let deviceName = { return UIDevice.current.model}
        public static let deviceType = { return UIDevice.current.userInterfaceIdiom == .phone ? "Phone" : "Tablet"}
        public static let appVersion = { return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""}
        public static let connectionType = { () -> String in
            if let reachability = try? Reachability(){
                switch reachability.connection {
                case .cellular:
                    let networkInfo = CTTelephonyNetworkInfo()
                    let networkString = networkInfo.currentRadioAccessTechnology
                    if networkString == CTRadioAccessTechnologyLTE{
                        return "LTE"
                    }else if networkString == CTRadioAccessTechnologyWCDMA{
                        return "3G"
                    }else if networkString == CTRadioAccessTechnologyEdge{
                        return "EDGE"
                    }
                case .wifi:
                    return "WiFi"
                default:
                    return ""
                }
            }
            return ""
        }
    }
}
