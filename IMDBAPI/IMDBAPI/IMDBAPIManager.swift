import Foundation

final public class IMDBAPIManager {
    public enum Environment {
        case development, production
    }

    private(set) static var apiKey: String?
    private(set) static var environment: Environment = .development

    public class func configure(environment: Environment, apiKey: String) {
        self.environment = environment
        self.apiKey = apiKey
    }
}
