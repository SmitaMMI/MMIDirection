//
//  mmiAdvices.swift
//
//  Created by CEINFO on 9/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class mmiAdvices: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pt = "pt"
    static let seconds = "seconds"
    static let meters = "meters"
    static let text = "text"
    static let iconId = "icon_id"
    static let exitNr = "exit_nr"
  }

  // MARK: Properties
  public var pt: mmiPt?
  public var seconds: Int?
  public var meters: Int?
  public var text: String?
  public var iconId: Int?
  public var exitNr: Int?

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
    pt = mmiPt(json: json[SerializationKeys.pt])
    seconds = json[SerializationKeys.seconds].int
    meters = json[SerializationKeys.meters].int
    text = json[SerializationKeys.text].string
    iconId = json[SerializationKeys.iconId].int
    exitNr = json[SerializationKeys.exitNr].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pt { dictionary[SerializationKeys.pt] = value.dictionaryRepresentation() }
    if let value = seconds { dictionary[SerializationKeys.seconds] = value }
    if let value = meters { dictionary[SerializationKeys.meters] = value }
    if let value = text { dictionary[SerializationKeys.text] = value }
    if let value = iconId { dictionary[SerializationKeys.iconId] = value }
    if let value = exitNr { dictionary[SerializationKeys.exitNr] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.pt = aDecoder.decodeObject(forKey: SerializationKeys.pt) as? mmiPt
    self.seconds = aDecoder.decodeObject(forKey: SerializationKeys.seconds) as? Int
    self.meters = aDecoder.decodeObject(forKey: SerializationKeys.meters) as? Int
    self.text = aDecoder.decodeObject(forKey: SerializationKeys.text) as? String
    self.iconId = aDecoder.decodeObject(forKey: SerializationKeys.iconId) as? Int
    self.exitNr = aDecoder.decodeObject(forKey: SerializationKeys.exitNr) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(pt, forKey: SerializationKeys.pt)
    aCoder.encode(seconds, forKey: SerializationKeys.seconds)
    aCoder.encode(meters, forKey: SerializationKeys.meters)
    aCoder.encode(text, forKey: SerializationKeys.text)
    aCoder.encode(iconId, forKey: SerializationKeys.iconId)
    aCoder.encode(exitNr, forKey: SerializationKeys.exitNr)
  }

}
