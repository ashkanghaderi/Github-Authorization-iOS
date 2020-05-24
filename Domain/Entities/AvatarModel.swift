import Foundation
public  struct Avatar: Codable{
  public init(thumb: String, large: String){
    self.thumbnail = thumb
    self.large = large
    
  }
  public let thumbnail: String
  public let large: String
}
