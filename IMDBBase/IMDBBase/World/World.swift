//
//  World.swift
//  IMDBBase
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation

struct World {
    var app = World.App()
}

#if DEBUG
var Current = World()
#else
let Current = World()
#endif
