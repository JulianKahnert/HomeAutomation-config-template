//
//  ConfigImporter.swift
//  Config
//
//  Created by Julian Kahnert on 14.02.25.
//

import Foundation
import HAImplementations
import HAModels

@main
struct ConfigImporter {
    static func main() async throws {

        // get config from the ./config folder
        let url = URL(string: "http://\(host):\(port)")!
        let automations = getAllAutomations(location)
            .map(AnyAutomation.create(from:))
        let configDto = ConfigDTO(location: location, automations: automations)

        // Create the URL for the /config endpoint.
        let postUrl = url.appendingPathComponent("config")
        var request = URLRequest(url: postUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode configDto as JSON and assign it as the HTTP body.
        let jsonData = try JSONEncoder().encode(configDto)
        request.httpBody = jsonData

        // apply config
        print("Trying to connect to \(url)")
        let (_, response) = try await URLSession.shared.data(for: request)
        let httpResponse = (response as! HTTPURLResponse)

        if httpResponse.statusCode == 200 {
            print("\n\n🚀 successfully changed automations")
        } else if httpResponse.statusCode == 422 {
            print("\n\n❌ Validation failed - automations have not been changed")
        } else {
            print("\n\n❌ failed to change automations:\n\(response)")
        }
    }
}
