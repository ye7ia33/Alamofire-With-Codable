
//
//  ServerRequest.swift
//  Created by Yahia El-Dow on 6/24/17.
//  Copyright © 2017 Production Code. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class AF : NSObject {
    static let httpMethod_GET    =  HTTPMethod.get
    static let httpMethod_POST   =  HTTPMethod.post
    static let httpMethod_PUT    =  HTTPMethod.put
    static let httpMethod_DELETE =  HTTPMethod.delete
    
    static let urlEncoding = URLEncoding.default
    static let headers = ["Content-Type": "application/x-www-form-urlencoded" ,
                          "Cache-Control": "no-cache" ,
                          "Accept-Language" : "en"
                                ]
    
    class func request (request_url : String ,
                        httpMethod : HTTPMethod = .get ,
                        paramter : [String : AnyObject]? = nil ,
                        Result:@escaping(_ result : Any? ,_ errorCode : Any? , _ errorMessage : Any?)->()) {
        
        print(request_url)
        Alamofire.request( request_url ,
            method: httpMethod ,
            parameters: paramter ,
            encoding: urlEncoding  ,
            headers: headers )
            .validate(statusCode: 200..<400)
            .responseJSON(completionHandler: {

                response in
                let statusCode = response.response?.statusCode

                switch response.result
                {
                case .failure(let error) :
                    print("> Error on Response JSON " , error.localizedDescription)
                    let errorMessage = "\(error.localizedDescription)"
                    Result(nil , statusCode , errorMessage)

                    return
                case .success(let requestResult):
                    Result(requestResult, statusCode , nil)
                    return

                    
                }
            })
    }
}
