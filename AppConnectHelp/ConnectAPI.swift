//
//  ConnectAPI.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/8.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Cocoa
import Alamofire
func printLog<T>(message: T,
                 file: String = #file,
                 method: String = #function,
                 line: Int = #line)
{
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
class ConnectAPI: NSObject {
    func apps(_ signedToken:String , success:@escaping (String?) -> Void) {
        let path = "https://api.appstoreconnect.apple.com/v1/apps"
        let headers: HTTPHeaders = ["Authorization" : "Bearer " + signedToken,"Content-Type" : "application/json"]
        AF.request(path,headers: headers).responseJSON { (response) in
            printLog(message: "Response: \(String(describing: response.response))")
            success(String(describing: response.value))
            print(self)
        }
    }
    
    
}
