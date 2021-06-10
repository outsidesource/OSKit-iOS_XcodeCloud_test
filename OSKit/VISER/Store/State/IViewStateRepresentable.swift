//
//  IViewStateRepresentable.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public protocol IViewStateRepresentable {
    func setViewState(_ viewState: IViewState)
}

// TODO: - 0 ADD SwiftUI extensions

extension UIView: IViewStateRepresentable {
    
    public func setViewState(_ viewState: IViewState) {
        
        if let self = self as? UILabel, let viewState = viewState as? ILabelState {
            self.setLabelState(viewState)
        } else if let self = self as? UIButton, let viewState = viewState as? IButtonState {
            self.setButtonState(viewState)
        } else if let self = self as? UISegmentedControl, let viewState = viewState as? ISegmentedControlState {
            self.setSegmentedControlState(viewState)
        } else if let self = self as? UISlider, let viewState = viewState as? ISliderState {
            self.setSliderState(viewState)
        } else if let self = self as? UISwitch, let viewState = viewState as? ISwitchState {
            self.setSwitchState(viewState)
        } else if let self = self as? UITextField, let viewState = viewState as? ITextFieldState {
            self.setTextFieldState(viewState)
        } else if let self = self as? UITableViewCell, let viewState = viewState as? ITableViewCellState {
            self.setTableViewCellState(viewState)
        } else if let self = self as? OSProgressView, let viewState = viewState as? IProgressViewState {
            self.setProgressViewState(viewState)
        } else {
            self._setViewState(viewState)
        }
        
    }
    
    internal func _setViewState(_ viewState: IViewState) {
        
        if let isHidden = viewState.isHidden { self.isHidden = isHidden }
        if let isEnabled = viewState.isEnabled { self.isUserInteractionEnabled = isEnabled }
        if let alpha = viewState.alpha { self.alpha = alpha }
        if let tag = viewState.tag { self.tag = tag }
        
    }
    
}

public extension IViewStateRepresentable where Self: UILabel {
    
    func setLabelState(_ labelState: ILabelState) {
        self._setViewState(labelState)
        if let text = labelState.text { self.text = text }
    }
    
}

public extension IViewStateRepresentable where Self: UIControl {
    
    func setControlState(_ controlState: IControlState) {
        self._setViewState(controlState)
        if let isSelected = controlState.isSelected { self.isSelected = isSelected }
    }
    
}

public extension IViewStateRepresentable where Self: UIButton {
    
    func setButtonState(_ buttonState: IButtonState) {
        setControlState(buttonState)
        if let title = buttonState.title { self.setTitle(title, for: .normal) }
    }
    
}

public extension IViewStateRepresentable where Self: UITextField {
    
    func setTextFieldState(_ textFieldState: ITextFieldState) {
        self.setControlState(textFieldState)
        if let text = textFieldState.text { self.text = text }
    }
    
}

public extension IViewStateRepresentable where Self: UITableViewCell {
    
    func setTableViewCellState(_ tableViewCellState: ITableViewCellState) {
        self._setViewState(tableViewCellState)
        if let textLabelState = tableViewCellState.textLabelState { self.textLabel?.setLabelState(textLabelState) }
        if let detailTextLabelState = tableViewCellState.detailTextLabelState { self.detailTextLabel?.setLabelState(detailTextLabelState) }
    }
    
}

public extension IViewStateRepresentable where Self: OSTableViewCell {
    
    func setOSTableViewCellState(_ tableViewCellState: ITableViewCellState) {
        self._setViewState(tableViewCellState)
        if let textLabelState = tableViewCellState.textLabelState { self.label?.setLabelState(textLabelState) }
        if let detailTextLabelState = tableViewCellState.detailTextLabelState { self.detailLabel?.setLabelState(detailTextLabelState) }
    }
    
}

public extension IViewStateRepresentable where Self: UISegmentedControl {
    
    func setSegmentedControlState(_ segmentedControlState: ISegmentedControlState) {
        self.setControlState(segmentedControlState)
        if let selectedSegmentIndex = segmentedControlState.selectedSegmentIndex { self.selectedSegmentIndex = selectedSegmentIndex }
    }
    
}

public extension IViewStateRepresentable where Self: UISlider {
    
    func setSliderState(_ sliderState: ISliderState) {
        self.setControlState(sliderState)
        if let minimumValue = sliderState.minimumValue { self.minimumValue = minimumValue }
        if let maximumValue = sliderState.maximumValue { self.maximumValue = maximumValue }
        if let value = sliderState.value { self.value = value }
    }
    
}

public extension IViewStateRepresentable where Self: UISwitch {
    
    func setSwitchState(_ switchState: ISwitchState) {
        self.setControlState(switchState)
        if let isOn = switchState.isOn { self.isOn = isOn }
    }
    
}

public extension IViewStateRepresentable where Self: OSProgressView {
    
    func setProgressViewState(_ progressViewState: IProgressViewState) {
        self._setViewState(progressViewState)
        if let progressState = progressViewState.progressState { self.progressState = progressState }
    }
    
}

extension UINavigationItem: IViewStateRepresentable {
    
    public func setViewState(_ viewState: IViewState) {
        
        if let viewState = viewState as? INavigationItemState {
            self.setNavigationItemState(viewState)
        }
        
    }
    
    func setNavigationItemState(_ navigationItemState: INavigationItemState) {
        if let title = navigationItemState.title { self.title = title }
        if let prompt = navigationItemState.prompt { self.prompt = prompt }
        if let backButtonTitle = navigationItemState.backButtonTitle { self.backButtonTitle = backButtonTitle }
        if let hidesBackButton = navigationItemState.hidesBackButton { self.hidesBackButton = hidesBackButton }
    }
    
}
