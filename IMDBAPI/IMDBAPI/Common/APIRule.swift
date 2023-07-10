import Foundation

protocol APIRule {
    associatedtype SuccessResponseType = Codable

    func makeRequest() throws -> URLRequest
    func decodeSuccessResponse(data: Data) throws -> SuccessResponseType
    func decodeError4XXResponse(data: Data) throws -> Error
}
