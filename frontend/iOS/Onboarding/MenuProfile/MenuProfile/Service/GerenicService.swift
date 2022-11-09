//
//  GerenicService.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 09/11/22.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
}
