//
//  BundleExtension.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/08/13.
//

import Foundation

/// API 주소값을 숨기기 위해, Bundle Extension으로 plist의 URL을 가져올 수 있도록 구현
extension Bundle {
    var userAPIUrl: String {
        guard let filePath = self.path(forResource: "APIURL", ofType: "plist") else { return "" }
        guard let source = NSDictionary(contentsOfFile: filePath) else { return "" }
        guard let url = source["UserAPIUrl"] as? String else { fatalError("api url error") }
        
        return url
    }
    
    var testAccessToken: String {
        guard let filePath = self.path(forResource: "APIURL", ofType: "plist") else { return "" }
        guard let source = NSDictionary(contentsOfFile: filePath) else { return "" }
        guard let url = source["testAccessToken"] as? String else { fatalError("token fetch error") }
        
        return url
    }
}
