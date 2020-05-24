import Foundation

public enum AuthenticationStatus: Int {
  case notDetermined = -1
  case tokenExpired = -2
  case loggedIn = 1
}
