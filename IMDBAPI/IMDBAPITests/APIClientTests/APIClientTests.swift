import XCTest
@testable import IMDBAPI

final class APITests: XCTestCase {
    var mockNetworkSession: MockNetworkSession?

    override func setUpWithError() throws {
        mockNetworkSession = MockNetworkSession()
    }

    override func tearDownWithError() throws {
        mockNetworkSession = nil
        Current = World()
    }

    func testAPI_success() async throws {
        // GIVEN
        // the api client is ready to be used
        let session = try XCTUnwrap(mockNetworkSession)
        Current.networkSession = { session }
        session.mockJSONData = session.readLocalJSONFile(forName: "MockRuleSuccess")
        session.mockURLResponse = HTTPURLResponse(url: URL(string: "www.starling.com")!,
                                                  statusCode: 200,
                                                  httpVersion: "1.0",
                                                  headerFields: nil)
        // WHEN
        // an endpoint rule is triggered
        let mockRule = MockAPIRule()
        let response = try await APIClient.perform(with: mockRule)

        // IT
        // SHOULD return an successfully decoded response
        XCTAssertEqual(response.message, "Hello World!")
    }

    func testAPI_error401() async throws {
        // GIVEN
        // the api client is ready to be used
        // and expected error type is 401
        let session = try XCTUnwrap(mockNetworkSession)
        Current.networkSession = { session }
        session.mockJSONData = session.readLocalJSONFile(forName: "MockRule401ErrorMessage")
        session.mockURLResponse = HTTPURLResponse(url: URL(string: "www.starling.com")!,
                                                  statusCode: 401,
                                                  httpVersion: "1.0",
                                                  headerFields: nil)
        // WHEN
        // an endpoint rule is triggered
        let mockRule = MockAPIRule()

        // IT
        // SHOULD return an successfully decoded response
        do {
            _ = try await APIClient.perform(with: mockRule)
            XCTFail("Network call shoul trigger an error")
        } catch {
            XCTAssertTrue(error is APIError)
            let apiError = try XCTUnwrap(error as? APIError)
            XCTAssertEqual(apiError, APIError.error4XX(statusCode: 401))
        }
    }
}
