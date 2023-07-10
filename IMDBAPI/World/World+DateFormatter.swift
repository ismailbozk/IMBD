extension World {
    struct IMDBDateFormatter {
        static var dateFormatter: () -> ISO8601DateFormatter = {
            let formatter = ISO8601DateFormatter()
            return formatter
        }
    }
}
