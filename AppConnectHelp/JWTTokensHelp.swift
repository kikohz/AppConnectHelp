//
//  JWTTokensHelp.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/7.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Cocoa
import SwiftJWT

struct AppConnectClaims: Claims {
    let iss: String
    let exp: Date
    let aud: String
}
class JWTTokensHelp: NSObject {

    func generate(path: String) -> String {
        let appClaims = AppConnectClaims(iss: "f66431c2-18fc-405b-9051-28b7e8de8ed7", exp: Date(timeIntervalSinceNow: 1200), aud: "appstoreconnect-v1")
        do {
            let privateKey: Data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let myHeader = Header(kid: "5V823HWC8U")
            let appJWT = JWT(header: myHeader, claims: appClaims)
            let jwtSigner = JWTSigner.es256(privateKey: privateKey)
            let jwtEncoder = JWTEncoder(jwtSigner: jwtSigner)
            let jwtString = try jwtEncoder.encodeToString(appJWT)
            print(jwtString)
            return jwtString
        }
        catch {
            return "出错了"
        }
    }
}
