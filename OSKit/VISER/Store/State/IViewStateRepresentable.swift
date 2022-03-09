//
//  IViewStateRepresentable.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public protocol IViewStateRepresentable {
    func setViewState<StateType: IViewState>(_ viewState: StateType)
}

extension UIView: IViewStateRepresentable { }

public extension IViewStateRepresentable where Self: UIView {
    
    func setViewState<StateType: IViewState>(_ viewState: StateType) {
        if let tag = viewState.tag { self.tag = tag }
        if let isHidden = viewState.isHidden { self.isHidden = isHidden }
        if let isEnabled = viewState.isEnabled { self.isUserInteractionEnabled = isEnabled }
    }
    
}

// MARK: - UIView

public extension IViewStateRepresentable where Self: UIActivityIndicatorView {
    
    func setActivityIndicatorViewState<StateType: IActivityIndicatorViewState>(_ activityIndicatorViewState: StateType) {
        self.setViewState(activityIndicatorViewState)
        
        if let isAnimating = activityIndicatorViewState.isAnimating {
            if isAnimating {
                if !self.isAnimating {
                    self.startAnimating()
                }
            } else {
                if self.isAnimating {
                    self.stopAnimating()
                }
            }
        }
    }

}

public extension IViewStateRepresentable where Self: UIImageView {

    func setImageViewState<StateType: IImageViewState>(_ imageViewState: StateType) {
        self.setViewState(imageViewState)
        if let imageName = imageViewState.imageName { self.image = UIImage(named: imageName) }
    }

}

public extension IViewStateRepresentable where Self: UILabel {
    
    func setLabelState<StateType: ILabelState>(_ labelState: StateType) {
        self.setViewState(labelState)
        if let text = labelState.text { self.text = text }
    }

}

public extension IViewStateRepresentable where Self: UIProgressView {
    
    func setProgressViewState<StateType: IProgressViewState>(_ progressState: StateType) {
        self.setViewState(progressState)
        if let progress = progressState.progress { self.progress = progress }
    }

}

// MARK: - UIControl

public extension IViewStateRepresentable where Self: UIControl {
    
    func setControlState<StateType: IControlState>(_ controlState: StateType) {
        self.setViewState(controlState)
        if let isSelected = controlState.isSelected { self.isSelected = isSelected }
        if let isHighlighted = controlState.isHighlighted { self.isHighlighted = isHighlighted }
    }

}

public extension IViewStateRepresentable where Self: UIButton {
    
    func setButtonState<StateType: IButtonState>(_ buttonState: StateType) {
        self.setControlState(buttonState)
        if let title = buttonState.title { self.setTitle(title, for: .normal) }
    }

}

public extension IViewStateRepresentable where Self: UISegmentedControl {

    func setSegmentedControlState<StateType: ISegmentedControlState>(_ segmentedControlState: StateType) {
        self.setControlState(segmentedControlState)
        if let selectedSegmentIndex = segmentedControlState.selectedSegmentIndex { self.selectedSegmentIndex = selectedSegmentIndex }
    }
    
}

public extension IViewStateRepresentable where Self: UISlider {

    func setSliderState<StateType: ISliderState>(_ sliderState: StateType) {
        self.setControlState(sliderState)
        if let minimumValue = sliderState.minimumValue { self.minimumValue = minimumValue }
        if let maximumValue = sliderState.maximumValue { self.maximumValue = maximumValue }
        if let value = sliderState.value { self.value = value }
    }
    
}

public extension IViewStateRepresentable where Self: UISwitch {

    func setSwitchState<StateType: ISwitchState>(_ switchState: StateType) {
        self.setControlState(switchState)
        if let isOn = switchState.isOn { self.isOn = isOn }
    }
    
}

public extension IViewStateRepresentable where Self: UITextField {
    
    func setTextFieldState<StateType: ITextFieldState>(_ textFieldState: StateType) {
        self.setControlState(textFieldState)
        if let text = textFieldState.text { self.text = text }
    }

}

// MARK: - Composite Views

public extension IViewStateRepresentable where Self: UITableViewCell {
    
    func setTableViewCellState<StateType: ITableViewCellState>(_ tableViewCellState: StateType) {
        self.setViewState(tableViewCellState)
        if let textLabelState = tableViewCellState.textLabelState { self.textLabel?.setLabelState(textLabelState) }
        if let detailTextLabelState = tableViewCellState.detailTextLabelState { self.detailTextLabel?.setLabelState(detailTextLabelState) }
    }

}

//extension UINavigationItem: IViewStateRepresentable {
//
//    public func setViewState(_ viewState: IViewState) {
//
//        if let viewState = viewState as? INavigationItemState {
//            self.setNavigationItemState(viewState)
//        }
//
//    }
//
//    func setNavigationItemState(_ navigationItemState: INavigationItemState) {
//        if let title = navigationItemState.title { self.title = title }
//        if let prompt = navigationItemState.prompt { self.prompt = prompt }
//        if let backButtonTitle = navigationItemState.backButtonTitle { self.backButtonTitle = backButtonTitle }
//        if let hidesBackButton = navigationItemState.hidesBackButton { self.hidesBackButton = hidesBackButton }
//    }
//
//}
