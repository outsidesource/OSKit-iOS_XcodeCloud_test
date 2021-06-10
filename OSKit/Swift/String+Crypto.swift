//
//  String+Crypto.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import CommonCrypto

public enum HMACAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    var ccAlgorithm: CCHmacAlgorithm {
        
        var result: Int = 0
        
        switch self {
        case .MD5:
            result = kCCHmacAlgMD5
        case .SHA1:
            result = kCCHmacAlgSHA1
        case .SHA224:
            result = kCCHmacAlgSHA224
        case .SHA256:
            result = kCCHmacAlgSHA256
        case .SHA384:
            result = kCCHmacAlgSHA384
        case .SHA512:
            result = kCCHmacAlgSHA512
        }
        
        return CCHmacAlgorithm(result)
        
    }
    
    var ccDigestLength: Int {
        
        var result: CInt = 0
        
        switch self {
        case .MD5:
            result = CC_MD5_DIGEST_LENGTH
        case .SHA1:
            result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:
            result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:
            result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        
        return Int(result)
        
    }
    
}

public extension String {

    // TODO: - 2 CONSIDER this swiftier version
//    func hmac(key: String) -> String {
//        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
//        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), key, key.count, self, self.count, &digest)
//        let data = Data(bytes: digest)
//        return data.map { String(format: "%02hhx", $0) }.joined()
//    }
    
    func hmac(algorithm: HMACAlgorithm, key: String) -> String {
        
        let cKey = key.cString(using: String.Encoding.utf8)
        let cData = self.cString(using: String.Encoding.utf8)
        var result = [CUnsignedChar](repeating: 0, count: Int(algorithm.ccDigestLength))
        
        CCHmac(algorithm.ccAlgorithm, cKey!, Int(strlen(cKey!)), cData!, Int(strlen(cData!)), &result)
        
        let data = Data(result)
        return data.base64EncodedString(options: [.lineLength76Characters])
        
    }
    
    func hmac16(algorithm: HMACAlgorithm, key: String) -> String {
        
        let cKey = key.cString(using: String.Encoding.utf8)
        let cData = self.cString(using: String.Encoding.utf8)
        var result = [CUnsignedChar](repeating: 0, count: Int(algorithm.ccDigestLength))
        
        CCHmac(algorithm.ccAlgorithm, cKey!, Int(strlen(cKey!)), cData!, Int(strlen(cData!)), &result)
        
        let data = Data(result)
        return data.base16EncodedString()
        
    }
    
}
