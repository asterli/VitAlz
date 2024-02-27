//
//  Extensions.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/18/24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String:Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]

        } catch {
            return [:] 
        }
    }
}
