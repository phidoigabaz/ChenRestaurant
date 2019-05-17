//
//  APIRequestProvider.swift
//  5dmax
//
//  Created by Huy Nguyen on 1/4/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import UIKit
import Alamofire

let kClientVersionHeaderField = "os_version_code"
let kClientOSHeaderField = "os_type"

let baseURL = "https://developers.zomato.com/api" //zomato URL
let apiVersion = "/v2.1"

/*
 *  APIRequestProvider takes responsible for build and provide request for service objects
 *  default header for request will be defined here
 */
class APIRequestProvider: NSObject {

    //mark: SINGLETON
    static var shareInstance: APIRequestProvider = {
        let instance = APIRequestProvider()
        return instance
    }()

    //mark: DEFAULT HEADER & REQUEST URL
    private var _headers: HTTPHeaders = [:]
    var headers: HTTPHeaders {
        set {
            _headers = headers
        }
        get {
            let headers: HTTPHeaders = [
                "Authorization": "",
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded",
                "user-key": Constants.ZOMATO_KEY,
                ]
            return headers
        }
    }

    private var _headersLogin: HTTPHeaders = [:]
    var headersLogin: HTTPHeaders {
        set {
            _headersLogin = headersLogin
        }
        get {
            let imei = UIDevice.current.identifierForVendor?.uuidString
            let authorization = "Bearer " + imei!

            let headersLogin: HTTPHeaders = [
                "Authorization": authorization,
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded"
            ]

            return headersLogin
        }
    }

    func commonParam() -> [String: String] {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let deviceOS = "ios"
        var param = [String: String]()
        param[kClientVersionHeaderField] = version
        param[kClientOSHeaderField] = deviceOS
        return param
    }

    private var _requestURL: String = baseURL
    var requestURL: String {
        set {
            _requestURL = requestURL
        }
        get {

            var url = _requestURL
            url.append("\(apiVersion)/")
            return url
        }
    }

    var alamoFireManager: SessionManager

    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30 // seconds for testing

        alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func getCategories() -> DataRequest {
        let urlString = requestURL.appending("categories")
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: nil,
                                        encoding: URLEncoding.queryString,
                                        headers: headers)
    }
    
    func getCollections(id: Int) -> DataRequest {
        let urlString = requestURL.appending("collections")
        var param = commonParam()
        param["city_id"] = String(id)
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: headers)
    }
}
