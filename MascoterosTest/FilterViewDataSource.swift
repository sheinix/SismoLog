//
//  FilterViewDataSource.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 15/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

enum TableSections : Int {
    
        case Magnitude
        case Depth
        case PickerFilter
        case Buttons
        case total
    
    public var title : String! {
        switch self {
        case .Magnitude:
            return "Magnitud"
        case .PickerFilter:
            return "   Cantidad |   Mes  |  Anio"
        case .Depth:
            return "Profundidad"
        case .Buttons:
            return ""
        default:
            break
        }
        return ""
    }
    
    
    public var filter: UIView! {
        
        var filterView = UIView()
        
        switch self {
            case .Magnitude, .Depth:
                filterView = getSlider()
        case .PickerFilter:
                filterView = getNumberPicker()
        case .Buttons:
            filterView = getButtonView()
        default:
            break
        }
        
        return filterView

    }
    
    public var numberOfRows : Int! {
        
        //Siempre una row por section por ahora
        switch self {
        case .Magnitude, .PickerFilter, .Depth, .Buttons:
            return 1
        default:
            break
        }
        
        return 1
    }
    
    public var height : CGFloat! {
        switch self {
        case .Magnitude, .Depth:
            return 80
        case .Buttons:
            return 60
        default:
            break
        }
        return 214
    }
    
    fileprivate func getSlider() -> UISlider {
        
        let slider = UISlider()
        slider.isContinuous = true
        
        switch self {
        case .Depth:
            slider.maximumValue = 10
            slider.minimumValue = 1
        case .Magnitude:
            slider.maximumValue = NumberConstants.maxMinimumMagnitude
            slider.minimumValue = 1
        default:
            break
        }
        slider.value = slider.maximumValue / 2
        
        return slider
    }
    
    fileprivate func getNumberPicker() -> UIPickerView {
        let picker = UIPickerView()
        picker.tintColor = UIColor.red
        
        return picker
    }
       
    fileprivate func getButtonView() -> UIButton {
        
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 9
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Aplicar", for: .normal)
        
        return button
    }
}
