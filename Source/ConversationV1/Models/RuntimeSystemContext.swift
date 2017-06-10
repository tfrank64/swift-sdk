/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import RestKit

/** For internal use only. */
public struct RuntimeSystemContext: JSONDecodable, JSONEncodable {

    public let runtimeSystemContextObject: [String: Any]?

    /**
     Initialize a `RuntimeSystemContext` with member variables.

     - parameter runtimeSystemContextObject: 

     - returns: An initialized `RuntimeSystemContext`.
    */
    public init(runtimeSystemContextObject: [String: Any]? = nil) {
        self.runtimeSystemContextObject = runtimeSystemContextObject
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `RuntimeSystemContext` model from JSON.
    public init(json: JSON) throws {
        runtimeSystemContextObject = try? json.getDictionaryObject(at: "RuntimeSystemContextObject")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `RuntimeSystemContext` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let runtimeSystemContextObject = runtimeSystemContextObject { json["RuntimeSystemContextObject"] = runtimeSystemContextObject }
        return json
    }
}
