//
//  CodableHandler.swift
//  SayAllo
//
//  Created by Yahia El-Dow on 2/6/19.
//  Copyright © 2019 Yahia El-Dow. All rights reserved.
//

import UIKit
import SwiftyJSON
struct CodableJson {
    static func decode<T : Decodable>(_ type: T.Type, from jsonObject: JSON) -> Any?
    {
        do {
            let data = jsonObject.description.data(using: .utf8)
            let jsonDecoder = JSONDecoder()
            let contactModel = try jsonDecoder.decode( type,from: data ??  Data() )
            return contactModel
        }catch let caught as NSError {
            print(caught)
            return nil
        }
    }
    
    
    
    
}
