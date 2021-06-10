//
//  SingleAction.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

// TODO: - 0 IMPLEMENT CompletableAction

public enum SingleAction<A: IAction, T: Any>: IAction {
    
    case subscribe(A)
    case subscribed(A)
    case success(A, T)
    case error(A, Error)
    case disposed(A)
    
    public var isComplete: Bool {
        
        switch self {
        case .success:
            return true
        case .error:
            return true
        case .disposed:
            return true
        default:
            return false
        }
        
    }
    
    public var isExecuting: Bool {
        return !isComplete
    }
    
}

extension SingleAction: Equatable where A: Equatable, T: Equatable {
    
    public static func == (lhs: SingleAction<A, T>, rhs: SingleAction<A, T>) -> Bool {
        
        switch (lhs, rhs) {
        case (.subscribe(let lhsAction), .subscribe(let rhsAction)):
            return lhsAction == rhsAction
            
        case (.subscribed(let lhsAction), .subscribed(let rhsAction)):
            return lhsAction == rhsAction
            
        case (.success(let lhsAction, let lhsType), .success(let rhsAction, let rhsType)):
            return lhsAction == rhsAction && lhsType == rhsType

        case (.error(let lhsAction, let lhsError), .error(let rhsAction, let rhsError)):
            
            // TODO: - 2 IMPROVE Error equality
            // See: https://kandelvijaya.com/2018/04/21/blog_equalityonerror/
            
            return lhsAction == rhsAction && lhsError.localizedDescription == rhsError.localizedDescription
            
        case (.disposed(let lhsAction), .disposed(let rhsAction)):
            return lhsAction == rhsAction
            
        default:
            return false
        }
        
    }
    
}

extension SingleAction: IStringIdentifiable where A: IStringIdentifiable {
    
    public var id: String {
        
        switch self {
            
        case .subscribe(let action):
            return action.id
            
        case .subscribed(let action):
            return action.id
            
        case .success(let action, _):
            return action.id
                
        case .error(let action, _):
            return action.id
            
        case .disposed(let action):
            return action.id
            
        }
        
    }
    
}
