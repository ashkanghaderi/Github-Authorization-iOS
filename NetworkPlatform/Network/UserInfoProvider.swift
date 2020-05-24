import Foundation
import Domain
import RxSwift

public class UserInfoProvider {
    
    private let disposeBag = DisposeBag()
    
    public static let shared: UserInfoProvider = {
        let user = UserInfoProvider()
        
        if UserDefaults.standard.bool(forKey: Constants.Keys.User.hasUserInfo.rawValue) == true{
            
            
            user.avatarURL = UserDefaults.standard.string(forKey: Constants.Keys.User.avatar.rawValue) ?? ""
            
            user.name = UserDefaults.standard.string(forKey: Constants.Keys.User.name.rawValue) ?? ""
            user.username = UserDefaults.standard.string(forKey: Constants.Keys.User.username.rawValue) ?? ""
            
            user.email = UserDefaults.standard.string(forKey: Constants.Keys.User.email.rawValue) ?? ""
           
            return user
            
        }
        user.hasUserInfo = false
       
        return user
    }()
    
   
    public private(set) var avatarURL: String! {
        didSet {
            UserDefaults.standard.set(avatarURL, forKey: Constants.Keys.User.avatar.rawValue)
        }
    }
    
   
    public private(set) var name: String! {
        didSet {
            UserDefaults.standard.set(name, forKey: Constants.Keys.User.name.rawValue)
        }
    }
    public private(set) var username: String! {
        didSet {
            UserDefaults.standard.set(username, forKey: Constants.Keys.User.username.rawValue)
        }
    }

     public private(set) var email: String! {
        didSet {
            UserDefaults.standard.set(email, forKey: Constants.Keys.User.email.rawValue)
        }
    }
    
    public private(set) var hasUserInfo: Bool! {
        didSet {
            UserDefaults.standard.set(hasUserInfo, forKey: Constants.Keys.User.hasUserInfo.rawValue)
        }
    }
    public private(set) var credit: Int! {
        didSet {
            UserDefaults.standard.set(hasUserInfo, forKey: Constants.Keys.User.credit.rawValue)
        }
    }
    public private(set) var withdraw: Int! {
        didSet {
            UserDefaults.standard.set(hasUserInfo, forKey: Constants.Keys.User.withdraw.rawValue)
        }
    }
    public private(set) var lotteryCode: Int! {
        didSet {
            UserDefaults.standard.set(hasUserInfo, forKey: Constants.Keys.User.lotteryCode.rawValue)
        }
    }

    public func resetData(){
        phoneNumber = ""
        inviteCode = ""
        username = ""
        credit = 0
        withdraw = 0
        birthDate = ""
        avatarURL = ""
        nationalCode = ""
        name = ""
        city = ""
        email = ""
        lotteryCode = 0
        hasUserInfo = false
    }
    
    public func getLatest() -> Observable<ProfileNetworkModel.GetProfile.Response>{
        
        var result = NetworkProvider().makeGetProfileNetwork().getProfile()
        result.subscribe(onNext: { [unowned self] (response) in
            self.phoneNumber = response.phoneNumber
            self.inviteCode = response.inviteCode
            self.avatarURL = response.avatar.large
            self.gender = response.gender
            self.nationalCode = response.nationalCode
            self.name = response.fullName
            self.username = response.username
            self.lotteryCode = response.lotteryCode
            self.birthDate = response.birthDate
            self.city = response.city.name
            self.email = response.email
            self.credit = response.credit
            self.withdraw = response.withdraw
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposeBag)
        if hasUserInfo {
            
            let lastData = ProfileNetworkModel.GetProfile.Response(avatar: Avatar(thumb: avatarURL, large: avatarURL), username: username, fullName: name, phoneNumber: phoneNumber, nationalCode: nationalCode, city: IdNameModel(name: city, id: -1), birthDate: birthDate, email: email, inviteCode: inviteCode, credit: credit, withdraw: withdraw, lotteryCode: lotteryCode, period: ScoreReportModel.empty(), total: ScoreReportModel.empty())
            result = Observable.merge(Observable.just(lastData), result)
        }
        return result
    }
}
