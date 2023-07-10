import Foundation
import IMDBFoundation
import XCTest

final class MockNetworkSession: NetworkSession {

    var mockJSONData: Data?
    var mockURLResponse: URLResponse?
    var error: Error?

    var invokedDataTaskRequest: URLRequest?
    var invokedDataTaskCallCount = 0
    func dataTask(with request: URLRequest) async throws -> NetworkSession.DataTaskResponse {
        invokedDataTaskCallCount += 1
        invokedDataTaskRequest = request

        if let error {
            throw error
        }

        let data = try XCTUnwrap(mockJSONData)
        let response = try XCTUnwrap(mockURLResponse)

        return DataTaskResponse(data: data, response: response)
    }

    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle(for: MockNetworkSession.self).path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
