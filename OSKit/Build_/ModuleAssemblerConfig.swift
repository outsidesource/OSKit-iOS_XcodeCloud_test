//
//  ModuleAssemblerConfig.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public struct ModuleAssemblerConfig {
    
    /// The name of the build configuration, this can be introspected at runtime for telemetry purposes
    /// - This should be a a description of the semantics such as: Brand Variant, Platform, Envivronment
    /// - Ex. Outside Source iOS Debug
    var name: String
    
    /// Array of included Modules to be registered with the Build
    var moduleAssemblies: [IModuleAssembly]
    
    public init(name: String, moduleAssemblies: [IModuleAssembly]) {
        self.name = name
        self.moduleAssemblies = moduleAssemblies
    }
}
