import Foundation

public enum InternalErrorCodes: Int {
  case jsonParsingError = -10024
}

public enum ErrorTypes: String{
  case internalError = "InternalError"
  case externalError = "ExternalError"
}


