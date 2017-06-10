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

/** LogExportResponse. */
public struct LogExportResponse: JSONDecodable, JSONEncodable {

    public let request: MessageRequest

    public let response: MessageResponse

    /// A unique identifier for the logged message.
    public let logID: String

    /// The timestamp for receipt of the message.
    public let requestTimestamp: String

    /// The timestamp for the system response to the message.
    public let responseTimestamp: String

    /**
     Initialize a `LogExportResponse` with member variables.

     - parameter request: 
     - parameter response: 
     - parameter logID: A unique identifier for the logged message.
     - parameter requestTimestamp: The timestamp for receipt of the message.
     - parameter responseTimestamp: The timestamp for the system response to the message.

     - returns: An initialized `LogExportResponse`.
    */
    public init(request: MessageRequest, response: MessageResponse, logID: String, requestTimestamp: String, responseTimestamp: String) {
        self.request = request
        self.response = response
        self.logID = logID
        self.requestTimestamp = requestTimestamp
        self.responseTimestamp = responseTimestamp
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `LogExportResponse` model from JSON.
    public init(json: JSON) throws {
        request = try json.decode(at: "request", type: MessageRequest.self)
        response = try json.decode(at: "response", type: MessageResponse.self)
        logID = try json.getString(at: "log_id")
        requestTimestamp = try json.getString(at: "request_timestamp")
        responseTimestamp = try json.getString(at: "response_timestamp")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `LogExportResponse` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["request"] = request.toJSONObject()
        json["response"] = response.toJSONObject()
        json["log_id"] = logID
        json["request_timestamp"] = requestTimestamp
        json["response_timestamp"] = responseTimestamp
        return json
    }
}
