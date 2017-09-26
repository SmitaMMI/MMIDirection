//
//  mmiBaseClass.swift
//
//  Created by CEINFO on 9/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class mmiBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let results = "results"
    static let version = "version"
    static let responseCode = "responseCode"
  }

  // MARK: Properties
  public var results: mmiResults?
  public var version: String?
  public var responseCode: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    results = mmiResults(json: json[SerializationKeys.results])
    version = json[SerializationKeys.version].string
    responseCode = json[SerializationKeys.responseCode].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = results { dictionary[SerializationKeys.results] = value.dictionaryRepresentation() }
    if let value = version { dictionary[SerializationKeys.version] = value }
    if let value = responseCode { dictionary[SerializationKeys.responseCode] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.results = aDecoder.decodeObject(forKey: SerializationKeys.results) as? mmiResults
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? String
    self.responseCode = aDecoder.decodeObject(forKey: SerializationKeys.responseCode) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(results, forKey: SerializationKeys.results)
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(responseCode, forKey: SerializationKeys.responseCode)
  }

}
