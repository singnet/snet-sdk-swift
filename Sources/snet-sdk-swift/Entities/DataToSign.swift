//
//  DataToSign.swift
//  snet-sdk-swift
//
//  Created by Jagan Kumar Mudila on 10/05/2021.
//

import Foundation

class DataToSign: NSObject, NSCoding {
    var type: String!
    var value: Any!
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.type = decoder.decodeObject(forKey: "type") as! String
        self.value = decoder.decodeObject(forKey: "value") as! Any
    }
    convenience init(type: String, value: Any) {
        self.init()
        self.type = type
        self.value = value
    }
    
    func encode(with coder: NSCoder) {
        if let type = type { coder.encode(type, forKey: "type") }
        if let value = value { coder.encode(value, forKey: "value") }
    }
}  //= (t: String, v: Any)

//extension DataToSign {
//    var array: [UInt8] {
//        var tmp = self
//        return [UInt8](UnsafeBufferPointer(start: &tmp.0, count: MemoryLayout.size(ofValue: tmp)))
//    }
//}
