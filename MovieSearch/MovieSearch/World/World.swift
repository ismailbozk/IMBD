import Foundation
import IMDBFoundation
import SwiftUI

/// Dependency injection for the API framework.
///
/// For more info please check out this presentation: https://www.pointfree.co/blog/posts/21-how-to-control-the-world
struct World {

    var movieAPI: MovieAPIProtocol = MovieAPI()
}

class WorldStateManager {
    @ObservedObject static var store =
    Store(state: AppState(),
          reducer: AppReducer.appReducer(state:action:),
          middleware: ApiMiddleware.appMiddleware)
}


//#if DEBUG
//    var Current = World()
//#else
    let Current = World()
//#endif
