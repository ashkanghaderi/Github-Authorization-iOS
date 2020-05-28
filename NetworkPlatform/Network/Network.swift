import Foundation
import Domain
import Alamofire
import RxAlamofire
import RxSwift
import KeychainSwift

final class Network<T: Decodable> {
    
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    let keychain = KeychainSwift()
    private var tokenString: String {
        return "Bearer " + (keychain.get("AccessToken") ?? "")
    }
    private var sharedHeaders: Dictionary<String,String> {
       
            return ["Authorization" : tokenString]
    }
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItems(_ path: String, itemId: String = "") -> Observable<[T]> {
        let absolutePath = itemId == "" ? endPoint + path : endPoint + "\(path)/\(itemId)"
        
        return RxAlamofire
            .request(.get, absolutePath, headers: sharedHeaders)
            .debug()
            .observeOn(scheduler)
            .responseData()
            .map({ [unowned self] (json) -> [T] in
                ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
                if 200 ... 299 ~= json.0.statusCode{
                    do{
                        return try JSONDecoder().decode([T].self, from: json.1)
                    } catch {
                        throw self.handle(error: error, data: json.1, StatusCode: json.0.statusCode)
                    }
                }
                throw self.handle(data: json.1, StatusCode: json.0.statusCode)
            })
    }
    
    func getItem(_ path: String, itemId: String = "") -> Observable<T> {
        let absolutePath = itemId == "" ? endPoint + path : endPoint + "\(path)/\(itemId)"
        
        return RxAlamofire
            .request(.get, absolutePath, headers: sharedHeaders)
            .debug()
            .observeOn(scheduler)
            .responseData()
            .map({ [weak self] (json) -> T in
							ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
                if 200 ... 299 ~= json.0.statusCode{
                    do{
                        let data = json.1
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(Formatter.iso8601)
                        
                        return try decoder.decode(T.self, from: data)
                        //            return try JSONDecoder().decode(T.self, from: json.1)
                    } catch let err {
                        print(String(bytes: json.1, encoding: .utf8) ?? "")
                        throw self?.handle(error: err, data: json.1, StatusCode: json.0.statusCode) ?? NSError(domain: "ERRRRR", code: 1010, userInfo: nil)
                    }
                }
                throw self?.handle(data: json.1, StatusCode: json.0.statusCode) ?? NSError(domain: "ERRRRR", code: 1010, userInfo: nil)
            })
            
    }
    func postItem(_ path: String, parameters: [String: Any]) -> Observable<T> {
        let absolutePath = endPoint + path
        print("POST: \non: \(absolutePath)\nparameters: \(parameters)")
        
        return RxAlamofire
            .request(.post, absolutePath, parameters: parameters, encoding: JSONEncoding.default, headers: sharedHeaders)
            .debug()
            .observeOn(scheduler)
            .responseData()
            .map({ [unowned self] (json) -> T in
                ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
                if 200 ... 299 ~= json.0.statusCode {
                    do{
                        return try JSONDecoder().decode(T.self, from: json.1)
                    } catch {
                        throw self.handle(error: error, data: json.1, StatusCode: json.0.statusCode)
                    }
                }
                throw self.handle(data: json.1, StatusCode: json.0.statusCode)
            })
    }
    func putItem(_ path: String, parameters: [String: Any]) -> Observable<T> {
        let absolutePath = endPoint + path
        print("PUT: \non: \(absolutePath)\nparameters: \(parameters)")
        
        return RxAlamofire
            .request(.put, absolutePath, parameters: parameters, encoding: JSONEncoding.default, headers: sharedHeaders)
            .debug()
            .observeOn(scheduler)
            .responseData()
            .map({ (json) -> T in
                ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
                if 200 ... 299 ~= json.0.statusCode{
                    do{
                        return try JSONDecoder().decode(T.self, from: json.1)
                    } catch {
                        throw self.handle(error: error, data: json.1, StatusCode: json.0.statusCode)
                    }
                }
                throw self.handle(data: json.1, StatusCode: json.0.statusCode)
            })
    }
    
    func postItems(_ path: String, parameters: [String: Any]) -> Observable<[T]> {
        let absolutePath = endPoint + path
        return RxAlamofire
            .request(.post, absolutePath, parameters: parameters, encoding: JSONEncoding.default, headers: sharedHeaders)
            .debug()
            .observeOn(scheduler)
            .responseData()
            .map({ [unowned self] (json) -> [T] in
                ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
                if 200 ... 299 ~= json.0.statusCode{
                    do{
                        return try JSONDecoder().decode([T].self, from: json.1)
                    } catch {
											
                        throw self.handle(error: error, data: json.1, StatusCode: json.0.statusCode)
                    }
                }
                throw self.handle(data: json.1, StatusCode: json.0.statusCode)
            })
    }
    
    func handle(error: Error, data: Data, StatusCode code: Int) -> NSError {
			ResponseAnalytics.printError(status: code, error: error)
        do {
            let responseError = try JSONDecoder().decode(ResponseMessage.Base.self, from: data)
					
            return NSError(domain: ErrorTypes.externalError.rawValue, code: code, userInfo: ["responseError": responseError])
        }catch{
            return NSError(domain: ErrorTypes.internalError.rawValue, code: code, userInfo: ["data" : data])
        }
    }
    
	func handle(data: Data, StatusCode code: Int) -> NSError {
		do {
			let responseError = try JSONDecoder().decode(ResponseMessage.Base.self, from: data)
			
			return NSError(domain: ErrorTypes.externalError.rawValue, code: code, userInfo: ["responseError": responseError])
		}catch{
			return NSError(domain: ErrorTypes.internalError.rawValue, code: code, userInfo: ["data" : data])
		}
	}
}
