//
//  IModuleAssembler.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public protocol IModuleAssembler { }

public extension IModuleAssembler {
    
    func assemble(container: IDependencyContainer, configs: [ModuleAssemblerConfig]) {

        configs.forEach { config in

            config.moduleAssemblies.forEach { moduleAssembly in
                moduleAssembly.assemble(container: container)
            }

        }

    }

}

public extension IModuleAssembler where Self: IDependencyContainer {
    
    func assemble(configs: [ModuleAssemblerConfig]) {

        configs.forEach { config in

            config.moduleAssemblies.forEach { moduleAssembly in
                moduleAssembly.assemble(container: self)
            }

        }

    }
    
}
