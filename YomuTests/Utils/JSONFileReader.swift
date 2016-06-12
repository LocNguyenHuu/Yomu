//
//  JSON.swift
//  Yomu
//
//  Created by Sendy Halim on 6/12/16.
//  Copyright © 2016 Sendy Halim. All rights reserved.
//

import Foundation

func JSONDataFromString(jsonString: String) -> AnyObject? {
  let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!

  return try? NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
}

func JSONDataFromFile(filename: String) -> AnyObject? {
  return NSBundle(forClass: JSONFileReader.self)
    .pathForResource(filename, ofType: "json")
    .flatMap { try? String(contentsOfFile: $0) }
    .flatMap(JSONDataFromString)
}

private class JSONFileReader {}
