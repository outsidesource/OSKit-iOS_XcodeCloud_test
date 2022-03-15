//
//  UIItem.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public protocol IViewState: IState, Equatable {
    var id: String? { get set }
    var tag: Int? { get set }
    var isHidden: Bool? { get set }
    var isEnabled: Bool? { get set }
    // TODO: - 1 ADD var accessibilityState: IAccessibilityState? { get set }
}

public protocol IActivityIndicatorViewState: IViewState {
    var isAnimating: Bool? { get set }
}

public protocol IImageViewState: IViewState {
    var imageName: String? { get set }
}

public protocol ILabelState: IViewState {
    var text: String? { get set }
    // TODO: - 1 ADD attributedText
}

public protocol IProgressViewState: IViewState {
    var progress: Float? { get set }
}

// TODO: - 0 ADD ICollectionViewCellState
// TODO: - 1 ADD IDatePickerState
// TODO: - 1 ADD IPageControlState
// TODO: - 0 ADD IPickerViewState
// TODO: - 1 ADD IScrollViewState
// TODO: - 0 ADD IStepperState

// MARK: - UIControl

public protocol IControlState: IViewState {
    var isSelected: Bool? { get set }
    var isHighlighted: Bool? { get set }
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

// MARK: - Composite Views

public protocol ITableViewCellState: IViewState {
    
    associatedtype TextLabelStateType: ILabelState
    var textLabelState: TextLabelStateType? { get }
    
    associatedtype DetailTextLabelStateType: ILabelState
    var detailTextLabelState: DetailTextLabelStateType? { get }
    
    associatedtype ImageViewStateType: IImageViewState
    var imageViewState: ImageViewStateType? { get }
    
    associatedtype ViewStateType: IViewState
    var accessoryViewState: ViewStateType? { get }
    
}

// TODO: - 0 EXTRACT
public protocol INavigationItemState: IState, Equatable {
    var title: String? { get set }
    var prompt: String? { get set }
    var backButtonTitle: String? { get set }
    var hidesBackButton: Bool? { get set }
}

// MARK: UIView

public struct ViewState: IViewState, Codable, Hashable {
    
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        
    }
    
}

public struct ActivityIndicatorViewState: IActivityIndicatorViewState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIActivityIndicatorView
    public var isAnimating: Bool?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, isAnimating: Bool? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.isAnimating = isAnimating
        
    }
    
}

public struct ImageViewState: IImageViewState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIImageView
    public var imageName: String?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, imageName: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.imageName = imageName
        
    }
    
}

public struct LabelState: ILabelState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UILabel
    public var text: String?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, text: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.text = text
        
    }
    
}

// MARK: - UIControl

public struct ButtonState: IButtonState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIControl
    public var isSelected: Bool?
    public var isHighlighted: Bool?
    
    // UIButton
    public var title: String?
    public var imageName: String?
    public var backgroundImageName: String?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, isSelected: Bool? = nil, isHighlighted: Bool? = nil, title: String? = nil, imageName: String? = nil, backgroundImageName: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.isSelected = isSelected
        self.isHighlighted = isHighlighted
        self.title = title
        self.imageName = imageName
        self.backgroundImageName = backgroundImageName
        
    }
    
}

public struct SegmentedControlState: ISegmentedControlState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIControl
    public var isSelected: Bool?
    public var isHighlighted: Bool?
    
    // UISegmentedControl
    public var selectedSegmentIndex: Int?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, isSelected: Bool? = nil, isHighlighted: Bool? = nil, selectedSegmentIndex: Int? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.isSelected = isSelected
        self.isHighlighted = isHighlighted
        self.selectedSegmentIndex = selectedSegmentIndex
        
    }
    
}

public struct SliderState: ISliderState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIControl
    public var isSelected: Bool?
    public var isHighlighted: Bool?
    
    // UISlider
    public var value: Float?
    public var minimumValue: Float?
    public var maximumValue: Float?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, isSelected: Bool? = nil, isHighlighted: Bool? = nil, value: Float? = nil, minimumValue: Float? = nil, maximumValue: Float? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.isSelected = isSelected
        self.isHighlighted = isHighlighted
        self.value = value
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        
    }
    
}

public struct SwitchState: ISwitchState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIControl
    public var isSelected: Bool?
    public var isHighlighted: Bool?
    
    // UISwitch
    public var isOn: Bool?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, isSelected: Bool? = nil, isHighlighted: Bool? = nil, isOn: Bool? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.isSelected = isSelected
        self.isHighlighted = isHighlighted
        self.isOn = isOn
        
    }
    
}

public struct TextFieldState: ITextFieldState, Codable, Hashable {
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIControl
    public var isSelected: Bool?
    public var isHighlighted: Bool?
    
    // UITextField
    public var text: String?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, isSelected: Bool? = nil, isHighlighted: Bool? = nil, isOn: Bool? = nil, text: String? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.isSelected = isSelected
        self.isHighlighted = isHighlighted
        self.text = text
        
    }
}

// MARK: - Composite Views

public struct TableViewCellState: ITableViewCellState, Codable, Hashable {
        
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UITableViewCell
    public var textLabelState: LabelState?
    public var detailTextLabelState: LabelState?
    public var imageViewState: ImageViewState?
    public var accessoryViewState: ViewState?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, textLabelState: LabelState? = nil, detailTextLabelState: LabelState? = nil, imageViewState: ImageViewState? = nil, accessoryViewState: ViewState? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        
        self.textLabelState = textLabelState
        self.detailTextLabelState = detailTextLabelState
        self.imageViewState = imageViewState
        self.accessoryViewState = accessoryViewState
        
    }
    
}

// TODO: - 1 REVIEW
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
    
    // UIView
    public var id: String?
    public var tag: Int?
    public var isHidden: Bool?
    public var isEnabled: Bool?
    
    // UIProgressView
    public var progress: Float?
    
    public init(id: String? = nil, tag: Int? = nil, isHidden: Bool? = nil, isEnabled: Bool? = nil, progress: Float? = nil) {
        
        self.id = id
        self.tag = tag
        self.isHidden = isHidden
        self.isEnabled = isEnabled
        self.progress = progress
        
    }
       
}

// TODO: - 0 EXTRACT
public struct NavigationItemState: INavigationItemState, Codable, Hashable {
    
    // UINavigationItem
    public var title: String?
    public var prompt: String?
    public var backButtonTitle: String?
    public var hidesBackButton: Bool?
    
    public init(title: String? = nil, prompt: String? = nil, backButtonTitle: String? = nil, hidesBackButton: Bool? = nil) {
        
        self.title = title
        self.prompt = prompt
        self.backButtonTitle = backButtonTitle
        self.hidesBackButton = hidesBackButton
        
    }
    
}
