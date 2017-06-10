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

/** RuntimeOutput. */
public struct RuntimeOutput: JSONDecodable, JSONEncodable {

    /// An array of responses to the user.
    public let text: [String]?

    /// Up to 50 messages logged with the request.
    public let logMessages: [RuntimeLogMessage]?

    /// An array of the nodes that were triggered to create the response.
    public let nodesVisited: [String]?

    /**
     Initialize a `RuntimeOutput` with member variables.

     - parameter text: An array of responses to the user.
     - parameter logMessages: Up to 50 messages logged with the request.
     - parameter nodesVisited: An array of the nodes that were triggered to create the response.

     - returns: An initialized `RuntimeOutput`.
    */
    public init(text: [String]? = nil, logMessages: [RuntimeLogMessage]? = nil, nodesVisited: [String]? = nil) {
        self.text = text
        self.logMessages = logMessages
        self.nodesVisited = nodesVisited
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `RuntimeOutput` model from JSON.
    public init(json: JSON) throws {
        text = try? json.decodedArray(at: "text", type: String.self)
        logMessages = try? json.decodedArray(at: "log_messages", type: RuntimeLogMessage.self)
        nodesVisited = try? json.decodedArray(at: "nodes_visited", type: String.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `RuntimeOutput` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let text = text {
            json["text"] = text.map { $0 }
        }
        if let logMessages = logMessages {
            json["log_messages"] = logMessages.map { $0.toJSONObject() }
        }
        if let nodesVisited = nodesVisited {
            json["nodes_visited"] = nodesVisited.map { $0 }
        }
        return json
    }
}
