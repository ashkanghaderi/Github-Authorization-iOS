import Foundation
public enum ProfileNetworkModel {
    public enum GetProfile: InteractiveModelType{
        public struct Request: Codable {
            public init(){
                
            }
        }
        public struct Response: Codable {
            public init(avatar: Avatar, username: String, fullName: String, email: String){
                self.avatar = avatar
                self.username = username
                self.fullName = fullName

                self.email = email

            }
            public let username: String?
            public let fullName: String?

            public let avatar: Avatar

            public let email: String?

        }
    }
    
    public enum EditProfile: InteractiveModelType{
        public struct Request: Codable {
            
            public let username: String
            public let fullName: String
            public let email: String
            
            public init( username: String, fullName: String, email: String){
                self.username = username
                self.fullName = fullName
               

                self.email = email
            }
        }
        public struct Response: Codable {
        }
    }
}
