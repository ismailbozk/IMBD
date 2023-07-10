import XCTest
@testable import IMDBAPI

final class IMDBAPITests: XCTestCase {

    var mockNetworkSession: MockNetworkSession?

    override func setUpWithError() throws {
        mockNetworkSession = MockNetworkSession()
    }

    override func tearDownWithError() throws {
        mockNetworkSession = nil
        Current = World()
    }

    func test_GETMovieSearch_production() async throws {
        // GIVEN
        // User is on the production environment
        // AND has a valid access token
        IMDBAPIManager.configure(environment: .production, apiKey: "token123")

        // GET Movie search endpoint rules are defined
        let session = try XCTUnwrap(mockNetworkSession)
        Current.networkSession = { session }
        session.mockJSONData = session.readLocalJSONFile(forName: "MockGETMovieSearchSuccess")
        session.mockURLResponse = HTTPURLResponse(url: URL(string: "www.imdb.com")!,
                                                  statusCode: 200,
                                                  httpVersion: "1.0",
                                                  headerFields: nil)

        // WHEN
        // the movie rule is triggered
        let response = try await MovieAPI.movieSearch(query: "Terminator")

        // IT should fetch the data from the correct endpoint
        let requestURL = try XCTUnwrap(session.invokedDataTaskRequest?.url)
        XCTAssertEqual(requestURL.absoluteString, "https://api.themoviedb.org/3/movie/popular?api_key=token123&query=Terminator")
        // AND the response should contain valid id
        XCTAssertTrue(response[0].id == 1)
        XCTAssertTrue(response[1].id == 2)
    }

    func test_GETMovieSearch_development() async throws {
        // GIVEN
        // User is on the production environment
        // AND has a valid access token
        IMDBAPIManager.configure(environment: .development, apiKey: "token123")

        // GET Movie search endpoint rules are defined
        let session = try XCTUnwrap(mockNetworkSession)
        Current.networkSession = { session }
        session.mockJSONData = session.readLocalJSONFile(forName: "MockGETMovieSearchSuccess")
        session.mockURLResponse = HTTPURLResponse(url: URL(string: "www.imdb.com")!,
                                                  statusCode: 200,
                                                  httpVersion: "1.0",
                                                  headerFields: nil)

        // WHEN
        // the movie rule is triggered
        let response = try await MovieAPI.movieSearch(query: "Terminator")

        // IT should fetch the data from the correct endpoint
        let requestURL = try XCTUnwrap(session.invokedDataTaskRequest?.url)
        XCTAssertEqual(requestURL.absoluteString, "https://api.themoviedb.org/3/movie/popular?api_key=token123&query=Terminator")

        // AND the response should contain valid id
        XCTAssertTrue(response[0].id == 1)
        XCTAssertTrue(response[1].id == 2)
    }

}
