//
//  JSONDecoderExt.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/23/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, withJSONObject object: Any, options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
}
