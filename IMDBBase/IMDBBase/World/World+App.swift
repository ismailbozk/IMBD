import Foundation

extension World {
    struct App {
        var isDebug: () -> Bool = {
            #if DEBUG
            return true
            #else
            return false
            #endif
        }

        /// This property holds a sandbox user access token.
        ///
        /// Authorization logic is more complex than just passing a token. However, since authentication is out of the scope of this tech challenge, this solution should be sufficient for now.
        var apiKey: () -> String = {
            "87027965472f4df58ab7f4cfb6212185"
        }
    }
}
