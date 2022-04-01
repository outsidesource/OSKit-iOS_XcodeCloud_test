//
//  ITableViewDelegate.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//


public protocol ITableViewDelegate: IViewDelegate {
    func didSelectIndexPath(_ indexPath: IndexPath)
}

extension ITableViewDelegate {
    public func didSelectIndexPath(_ indexPath: IndexPath) { }
}
