//
//  mmiResults.swift
//
//  Created by CEINFO on 9/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class mmiResults: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let alternatives = "alternatives"
    static let trips = "trips"
  }

  // MARK: Properties
  public var status: Int?
  public var alternatives: [mmiAlternatives]?
  public var trips: [mmiTrips]?

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
    if let items = json[SerializationKeys.alternatives].array { alternatives = items.map { mmiAlternatives(json: $0) } }
    if let items = json[SerializationKeys.trips].array { trips = items.map { mmiTrips(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = alternatives { dictionary[SerializationKeys.alternatives] = value.map { $0.dictionaryRepresentation() } }
    if let value = trips { dictionary[SerializationKeys.trips] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.alternatives = aDecoder.decodeObject(forKey: SerializationKeys.alternatives) as? [mmiAlternatives]
    self.trips = aDecoder.decodeObject(forKey: SerializationKeys.trips) as? [mmiTrips]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(alternatives, forKey: SerializationKeys.alternatives)
    aCoder.encode(trips, forKey: SerializationKeys.trips)
  }

}
