//
//  mmiAlternatives.swift
//
//  Created by CEINFO on 9/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class mmiAlternatives: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let duration = "duration"
    static let advices = "advices"
    static let pts = "pts"
    static let length = "length"
  }

  // MARK: Properties
  public var status: Int?
  public var duration: Int?
  public var advices: [mmiAdvices]?
  public var pts: String?
  public var length: Int?

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
    status = json[SerializationKeys.status].int
    duration = json[SerializationKeys.duration].int
    if let items = json[SerializationKeys.advices].array { advices = items.map { mmiAdvices(json: $0) } }
    pts = json[SerializationKeys.pts].string
    length = json[SerializationKeys.length].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = advices { dictionary[SerializationKeys.advices] = value.map { $0.dictionaryRepresentation() } }
    if let value = pts { dictionary[SerializationKeys.pts] = value }
    if let value = length { dictionary[SerializationKeys.length] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? Int
    self.advices = aDecoder.decodeObject(forKey: SerializationKeys.advices) as? [mmiAdvices]
    self.pts = aDecoder.decodeObject(forKey: SerializationKeys.pts) as? String
    self.length = aDecoder.decodeObject(forKey: SerializationKeys.length) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(advices, forKey: SerializationKeys.advices)
    aCoder.encode(pts, forKey: SerializationKeys.pts)
    aCoder.encode(length, forKey: SerializationKeys.length)
  }

}
