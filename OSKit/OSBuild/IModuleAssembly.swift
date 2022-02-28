//
//  IModuleAssembly.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

// TODO: VISERLite CONSIDER : AnyObject to allow assemblies to extend each other
public protocol IModuleAssembly {
    func assemble(container: IDependencyContainer)
}
