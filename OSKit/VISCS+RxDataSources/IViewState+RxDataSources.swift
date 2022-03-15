//
//  IViewState+RxDataSources.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxDataSources

extension IdentifiableType where Self: IStringIdentifiable {
    public var identity: String {
        return self.id
    }
}

extension IdentifiableType where Self: IViewState {
    public var identity: String {
        return self.id ?? ""
    }
}

extension ViewState: IdentifiableType { }
extension LabelState: IdentifiableType { }
extension ButtonState: IdentifiableType { }
extension SegmentedControlState: IdentifiableType { }
extension SliderState: IdentifiableType { }
extension SwitchState: IdentifiableType { }
extension TableViewCellState: IdentifiableType { }
extension SectionViewState: IdentifiableType { }

public extension SectionViewState where T: IdentifiableType & Equatable {
    
    var animitableSectionModel: AnimatableSectionModel<SectionViewState<S, T>, T> {
        return AnimatableSectionModel(model: self, items: sectionViewStates)
    }
}
