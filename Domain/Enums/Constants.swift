import CoreTelephony
import Reachability
public enum Constants {
    public enum Keys: String {
        //MARK: - Schedulers name
        case cacheSchedulerQueueName = "com.arianrp.Network.Cache.queue"
        
        //MARK: - Storage Keys
        public enum Authentication: String {
            case refreshToken = "com.arianrp.storagekeys.authentication.token.refresh"
            case accessToken = "com.arianrp.storagekeys.authentication.token.access"
            case UUID = "com.arianrp.storagekeys.authentication.info.uuid"
        }
        public enum User: String {
            case name = "com.arianrp.storagekeys.user.info.name"
            case status = "com.arianrp.storagekeys.user.info.status"
            case username = "com.arianrp.storagekeys.user.info.username"
            case inviteCode = "com.arianrp.storagekeys.user.info.inviteCode"
            case phone = "com.arianrp.storagekeys.user.info.phone"
            case gender = "com.arianrp.storagekeys.user.info.gender"
            case nationalCode = "com.arianrp.storagekeys.user.info.nationalCode"
            case province = "com.arianrp.storagekeys.user.info.province"
            case city = "com.arianrp.storagekeys.user.info.city"
            case email = "com.arianrp.storagekeys.user.info.email"
            case avatar = "com.arianrp.storagekeys.user.info.avatar"
            case birthDate = "com.arianrp.storagekeys.user.info.birthDate"
            case hasUserInfo = "com.arianrp.storagekeys.user.info.hasUserInfo"
            case credit = "com.arianrp.storagekeys.user.info.credit"
            case withdraw = "com.arianrp.storagekeys.user.info.withdraw"
            case lotteryCode = "com.arianrp.storagekeys.user.info.lotterCode"
        }
        public enum Financials: String {
            case credit = "com.arianrp.storagekeys.user.financials.credit"
            case withdraw = "com.arianrp.storagekeys.user.financials.withdraw"
        }
        public enum Settings: String {
            case baseURL = "com.arianrp.storagekeys.settings.url"
            case support = "com.arianrp.storagekeys.settings.support"
            case aboutUs = "com.arianrp.storagekeys.settings.about"
            case terms = "com.arianrp.storagekeys.settings.terms"
            case gateways = "com.arianrp.storagekeys.settings.gateways"
        }
    }
    
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
