import Foundation

extension World {
    struct APIEndpoint {
        var baseURL: () -> URL = {
            switch IMDBAPIManager.environment {
            case .development:
                return URL(string: "https://api.themoviedb.org/3")!
            case .production:
                return URL(string: "https://api.themoviedb.org/3")!
            }
        }
    }
}
