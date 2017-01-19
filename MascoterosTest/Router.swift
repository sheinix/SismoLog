//
//  Router.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import Alamofire

//Router para formar las url de la llamada a la API conformando a URLRequestConvertible de Alamofire

public enum Router: URLRequestConvertible {

    static let baseURLString = Sesmi.baseRequest
    
    case plain(parameters: Parameters)
    case year(yearNumber: String, parameters: Parameters)
    case month(yearNumber: String, monthNumber: String, parameters: Parameters)
    case totals
        
    //Solo voy a hacer gets por ahora:
    var method: HTTPMethod { return .get }
    
    //Armo los paths para año, mes y totals:
    var path: String! {
        
        switch self {
          
            case .year(let yearNumber, _):
                
                return "/" + yearNumber
            
            case .month(let yearNumber, let monthNumber, _):
                
                return "/" + yearNumber + "/" + monthNumber
            
            case .totals:
                return "/totals"
            
            case .plain(_): return ""
            
        }
    }
    
    // MARK: URLRequestConvertible
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
       
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            
            case .plain(let parameters), .year(_, let parameters), .month(_, _, let parameters):
                
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            
            case .totals:
                urlRequest = try URLEncoding.default.encode(urlRequest, with: [:])
 
        }
        
        return urlRequest
    }
}
