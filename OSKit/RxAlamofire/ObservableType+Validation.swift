//
//  ObservableType+Validation.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import RxSwift
import Alamofire
import RxAlamofire

public extension ObservableType where Self.Element == Alamofire.DataRequest {
    
    func validateResponseCode() -> Observable<Alamofire.DataRequest> {
        
        return self.validate(statusCode: 200..<300)
        
    }
    
    // TODO: - 2 CONSIDER improving by injecting ValidateOptions
    func validateResponseJSONData() -> Observable<Data> {
        
        return self
            .validateResponseCode()
            .validate(contentType: ["application/json"])
            .responseJSON()
            .map { response in
                
                if let error = response.error {
                    throw AlamofireValidationError.validationError(error: error)
                }
                
                guard let data = response.data  else {
                    throw AlamofireValidationError.invalidData
                }
                
                return data
                
        }
        
    }
    
}
