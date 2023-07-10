import Foundation
import IMDBFoundation

/// Dependency injection for the API framework.
///
/// For more info please check out this presentation: https://www.pointfree.co/blog/posts/21-how-to-control-the-world
struct World {
    var networkSession: () -> NetworkSession = { URLSession.shared }
    var api = APIEndpoint()
    var dateFormatter: () -> ISO8601DateFormatter = IMDBDateFormatter.dateFormatter
    var encoding = IMDBCodable()
}

#if DEBUG
    var Current = World()
#else
    let Current = World()
#endif
