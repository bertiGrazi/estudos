//
//  APICaller.swift
//  Pagination
//
//  Created by Grazi  Berti on 23/11/22.
//

import Foundation

class APICaller {
    var isPaginating = false
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        if pagination {
            self.isPaginating = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2)) {
            let originalData = [
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
            ]
            
            let newData = [
                "banana", "melancia","maça",
                "banana", "melancia","maça",
                "banana", "melancia","maça",
            ]
            completion(.success(pagination ? newData : originalData))
            if pagination {
                self.isPaginating = true
            }
        }
    }
}
