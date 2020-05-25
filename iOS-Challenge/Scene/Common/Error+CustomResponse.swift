//
//  Error+CustomResponse.swift
//  BarandehShow
//
//  Created by Behrad Kazemi on 12/31/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//

import Foundation
import Domain
extension Error {
    func getHTTPResponse() -> Domain.ResponseMessage.Base?{
        guard let response = (self as NSError).userInfo["responseError"] as? Domain.ResponseMessage.Base else{ return nil }
        return response
    }
}
