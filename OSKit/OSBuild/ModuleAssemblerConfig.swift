//
//  ModuleAssemblerConfig.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public struct ModuleAssemblerConfig {
    var name: String
    var moduleAssemblies: [IModuleAssembly]
    
    public init(name: String, moduleAssemblies: [IModuleAssembly]) {
        self.name = name
        self.moduleAssemblies = moduleAssemblies
    }
}
