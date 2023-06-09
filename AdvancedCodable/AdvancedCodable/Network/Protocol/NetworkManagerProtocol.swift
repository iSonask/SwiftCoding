//
//  NetworlManagerProtocol.swift
//  BasicHTTPManager
//
//  Created by Steven Curtis on 03/04/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    associatedtype aType
    var session: aType { get }

    func get(url: URL, completionBlock: @escaping (Result<Data, Error>) -> Void)
}
