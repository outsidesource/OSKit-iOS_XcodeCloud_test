//
//  IViewStateRepresentable+Rx.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift
import RxCocoa

// MARK: - UIView

public extension Reactive where Base: UIView {

    func viewState<StateType: IViewState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setViewState(viewState)
        }
    }
    
}

public extension Reactive where Base: UIActivityIndicatorView {

    func viewState<StateType: IActivityIndicatorViewState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setActivityIndicatorViewState(viewState)
        }
    }
    
}

public extension Reactive where Base: UIImageView {

    func viewState<StateType: IImageViewState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setImageViewState(viewState)
        }
    }
    
}

public extension Reactive where Base: UILabel {

    func viewState<StateType: ILabelState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setLabelState(viewState)
        }
    }
    
}

public extension Reactive where Base: UIProgressView {

    func viewState<StateType: IProgressViewState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setProgressViewState(viewState)
        }
    }
    
}

// MARK: - UIControl

public extension Reactive where Base: UIControl {

    func viewState<StateType: IControlState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setControlState(viewState)
        }
    }
    
}

public extension Reactive where Base: UIButton {

    func viewState<StateType: IButtonState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setButtonState(viewState)
        }
    }
    
}

public extension Reactive where Base: UISegmentedControl {

    func viewState<StateType: ISegmentedControlState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setSegmentedControlState(viewState)
        }
    }
    
}

public extension Reactive where Base: UISlider {

    func viewState<StateType: ISliderState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setSliderState(viewState)
        }
    }
    
}

public extension Reactive where Base: UISwitch {

    func viewState<StateType: ISwitchState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setSwitchState(viewState)
        }
    }
    
}

public extension Reactive where Base: UITextField {

    func viewState<StateType: ITextFieldState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setTextFieldState(viewState)
        }
    }
    
}


// MARK: - Composite Views

public extension Reactive where Base: UITableViewCell {

    func viewState<StateType: ITableViewCellState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setTableViewCellState(viewState)
        }
    }
    
}

// TODO: - 0 EXTRACT
public extension Reactive where Base: UINavigationItem {

    func navigationItemState<StateType: INavigationItemState>() -> Binder<StateType> {
        Binder(base) { base, viewState in
            base.setNavigationItemState(viewState)
        }
    }
    
}
