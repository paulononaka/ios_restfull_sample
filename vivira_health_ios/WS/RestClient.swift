import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient {
    
    static let URL = Constants.WS.URL
    
    class func getUsers(completionHandler: (result: Response<TOUsersList, NSError>) -> Void ){
        Alamofire.request(.GET, URL+Constants.WS.END_POINT.GET_USERS, parameters: nil)
            .responseObject() { (response: Response<TOUsersList, NSError>) in
                completionHandler(result: response)
        }
    }
}