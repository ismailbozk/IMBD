extension World {
    struct IMDBCodable {
        var jsonDecoder: () -> JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return decoder
        }
        var jsonEncoder: () -> JSONEncoder = {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            return encoder
        }
    }
}
