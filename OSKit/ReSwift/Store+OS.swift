//
//  Store+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import ReSwift

///// Conform ReSwfit.Store to OSKit.IStateStore
//extension Store: IStateStore where State: IStateContainer {
//    
//    public func getState(_ id: String) -> IState? {
//        return self.state.getState(id)
//    }
//    
//}
//
///// Conform ReSwift.Store to OSKit.IActionDispatcher
//extension Store: IActionDispatcher {
//    
//    public func dispatch(_ action: IAction) {
//        
//        /// Ensure OSKit iAction conforms to Action
//        guard let action = action as? Action else {
//            assertionFailure("action does not conform to ReSwift.Action")
//            return
//        }
//        
//        self.dispatch(action as Action)
//        
//    }
//    
//}
