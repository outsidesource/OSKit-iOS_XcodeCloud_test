//
//  ObservableAction.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public enum ObservableAction<A: IAction, T: Any>: IAction {
    
    case subscribe(A)
    case subscribed(A)
    case next(A, T)
    case complete(A)
    case error(A, Error)
    case disposed(A)
    
    public var isComplete: Bool {
        
        switch self {
        case .complete:
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
    
    /// Returns the latest element if case is .next
    public var latest: T? {
        
        switch self {
            
        case .next(_, let t):
            return t
        
        default:
            return nil
        }
        
    }
    
}

extension ObservableAction: Equatable where A: Equatable, T: Equatable {
    
    /// We cannot base comparions on Error type because we cannot type the Error type of Observable and Error is not Equatable
    //extension ObservableAction: Equatable where A:Equatable, T: Equatable, E: Equatable {
    
    public static func == (lhs: ObservableAction<A, T>, rhs: ObservableAction<A, T>) -> Bool {
        
        switch (lhs, rhs) {
        case (.subscribe(let lhsAction), .subscribe(let rhsAction)):
            return lhsAction == rhsAction
        
        case (.subscribed(let lhsAction), .subscribed(let rhsAction)):
            return lhsAction == rhsAction
        
        case (.next(let lhsAction, let lhsType), .next(let rhsAction, let rhsType)):
            return lhsAction == rhsAction && lhsType == rhsType
        
        case (.complete(let lhsAction), .complete(let rhsAction)):
            return lhsAction == rhsAction
            
        case (.error(let lhsAction, let lhsError), .error(let rhsAction, let rhsError)):
            
            // TODO: - IMPROVE Error equality
            // See: https://kandelvijaya.com/2018/04/21/blog_equalityonerror/
            
            return lhsAction == rhsAction && lhsError.localizedDescription == rhsError.localizedDescription
            
        case (.disposed(let lhsAction), .disposed(let rhsAction)):
            return lhsAction == rhsAction
            
        default:
            return false
        }
        
    }
    
}

extension ObservableAction: IStringIdentifiable where A: IStringIdentifiable {
    
    public var id: String {
        
        switch self {
        
        case .subscribe(let action):
            return action.id
            
        case .subscribed(let action):
            return action.id
            
        case .next(let action, _):
            return action.id
            
        case .complete(let action):
            return action.id
            
        case .error(let action, _):
            return action.id
            
        case .disposed(let action):
            return action.id
                
        }
        
    }
    
}
