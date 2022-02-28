//
//  UIItem.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import CoreGraphics

public protocol IViewState: IState {
    var id: String? { get set }
    var tag: Int? { get set }
    var isHidden: Bool? { get set }
    var isEnabled: Bool? { get set }
    var alpha: CGFloat? { get set }
    // TODO: - 1 ADD accessibilityState and IViewStateRepresentable setters
//    var accessibilityState: AccessibilityState? { get set }
}

public protocol IImageViewState: IViewState {
    var imageName: String? { get set }
}

public protocol IControlState: IViewState {
    var isSelected: Bool? { get set }
}

public protocol ILabelState: IViewState {
    var text: String? { get set }
}

public protocol IButtonState: IControlState {
    var title: String? { get set }
    var imageName: String? { get set }
    var backgroundImageName: String? { get set }
}

public protocol ISegmentedControlState: IControlState {
    var selectedSegmentIndex: Int? { get set }
}

public protocol ISliderState: IControlState {
    var value: Float? { get set }
    var minimumValue: Float? { get set }
    var maximumValue: Float? { get set }
}

public protocol ISwitchState: IControlState {
    var isOn: Bool? { get set }
}

public protocol ITextFieldState: IControlState {
    var text: String? { get set }
}

public protocol ITableViewCellState: IViewState {
    var textLabelState: LabelState? { get }
    var detailTextLabelState: LabelState? { get }
    var imageViewState: ImageViewState? { get }
    var accessoryViewState: ViewState? { get }
}

public protocol IProgressViewState: IViewState {
    var progressState: ProgressState? { get }
}

// TODO: REMOVE IViewState conformance
public protocol INavigationItemState: IViewState {
    var title: String? { get set }
    var prompt: String? { get set }
    var backButtonTitle: String? { get set }
    var hidesBackButton: Bool? { get set }
}

public struct ViewState: IViewState, Codable, Hashable {
    
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        
    }
    
}

public struct ImageViewState: IImageViewState, Codable, Hashable {
    
    /// UIImageView
    public var imageName: String?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, imageName: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.imageName = imageName
        
    }
    
}

public struct LabelState: ILabelState, Codable, Hashable {
    
    /// UILabel
    public var text: String?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, text: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.text = text
        
    }
    
}

public struct ButtonState: IButtonState, Codable, Hashable {
    
    /// UIButton
    public var title: String?
    public var imageName: String?
    public var backgroundImageName: String?
    
    /// UIControl
    public var isSelected: Bool?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, isSelected: Bool? = nil, title: String? = nil, imageName: String? = nil, backgroundImageName: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.isSelected = isSelected
        self.title = title
        self.imageName = imageName
        self.backgroundImageName = backgroundImageName
        
    }
    
}

public struct SegmentedControlState: ISegmentedControlState, Codable, Hashable {
    
    /// UISegmentedControl
    public var selectedSegmentIndex: Int?
    
    /// UIControl
    public var isSelected: Bool?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, isSelected: Bool? = nil, selectedSegmentIndex: Int? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.isSelected = isSelected
        self.selectedSegmentIndex = selectedSegmentIndex
        
    }
    
}

public struct SliderState: ISliderState, Codable, Hashable {
    
    /// UISlider
    public var value: Float?
    public var minimumValue: Float?
    public var maximumValue: Float?
    
    /// UIControl
    public var isSelected: Bool?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, isSelected: Bool? = nil, value: Float? = nil, minimumValue: Float? = nil, maximumValue: Float? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.isSelected = isSelected
        self.value = value
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        
    }
    
}

public struct SwitchState: ISwitchState, Codable, Hashable {
    
    /// UISwitch
    public var isOn: Bool?
    
    /// UIControl
    public var isSelected: Bool?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, isSelected: Bool? = nil, isOn: Bool? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.isSelected = isSelected
        self.isOn = isOn
        
    }
    
}

public struct TextFieldState: ITextFieldState, Codable, Hashable {
    
    /// UITextField
    public var text: String?
    
    /// UIControl
    public var isSelected: Bool?
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, isSelected: Bool? = nil, isOn: Bool? = nil, text: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.isSelected = isSelected
        self.text = text
        
    }
}

public struct TableViewCellState: ITableViewCellState, Codable, Hashable {
        
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    /// UITableViewCell
    public var textLabelState: LabelState?
    public var detailTextLabelState: LabelState?
    public var imageViewState: ImageViewState?
    public var accessoryViewState: ViewState?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, textLabelState: LabelState? = nil, detailTextLabelState: LabelState? = nil, imageViewState: ImageViewState? = nil, accessoryViewState: ViewState? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        
        self.textLabelState = textLabelState
        self.detailTextLabelState = detailTextLabelState
        self.imageViewState = imageViewState
        self.accessoryViewState = accessoryViewState
        
    }
    
}

public struct SectionViewState<S: IViewState, T: IViewState>: IStringIdentifiable {
    
    public var id: String
    public var headerViewState: S?
    public var sectionViewStates: [T]
    // TODO: - 2 ADD footerViewState
    
    public init(id: String, headerViewState: S?, sectionViewStates: [T]) {
        self.id = id
        self.headerViewState = headerViewState
        self.sectionViewStates = sectionViewStates
    }
    
}

extension SectionViewState: Equatable where S: Equatable, T: Equatable { }

public struct ProgressViewState: IProgressViewState, Codable, Hashable {
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    /// UIProgressView
    public var progressState: ProgressState?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, progressState: ProgressState? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        self.progressState = progressState
        
    }
       
}

public struct NavigationItemState: INavigationItemState, Codable, Hashable {
    
    /// UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    public var alpha: CGFloat?
    
    /// UINavigationItem
    public var title: String?
    public var prompt: String?
    public var backButtonTitle: String?
    public var hidesBackButton: Bool?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, alpha: CGFloat? = nil, title: String? = nil, prompt: String? = nil, backButtonTitle: String? = nil, hidesBackButton: Bool? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.alpha = alpha
        
        self.title = title
        self.prompt = prompt
        self.backButtonTitle = backButtonTitle
        self.hidesBackButton = hidesBackButton
        
    }
    
}
