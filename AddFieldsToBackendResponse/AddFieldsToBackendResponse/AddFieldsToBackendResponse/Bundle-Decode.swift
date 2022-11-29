//
//  Bundle-Decode.swift
//  AddFieldsToBackendResponse
//
//  Created by Steven Curtis on 13/09/2022.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, with decoder: JSONDecoder = JSONDecoder()) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw ErrorModel(errorDescription: "\(file) missing in \(self).")
        }

        guard let data = try? Data(contentsOf: url) else {
            throw ErrorModel(errorDescription: "\(file) missing in \(self).")
        }

        do {
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch {
            throw ErrorModel(errorDescription: "\(file) could not be decoded from \(self) with error: \(error).")
        }
    }
}
