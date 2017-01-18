//
//  FilterViewDataSource.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 15/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

enum TableSections : Int {
    
        case NumberOfEartquakes
        case Magnitude
        case PickerFilter
        case Buttons
        case total
    
    public var title : String! {
        switch self {
        case .Magnitude:
            return "Magnitud Minima"
        case .NumberOfEartquakes:
            return "Cantidad a visualizar"
        case .PickerFilter:
            return "Mes / Año"
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
            case .Magnitude, .NumberOfEartquakes:
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
        return 1
    }
    
    public var height : CGFloat! {
       
        switch self {
        case .Magnitude, .NumberOfEartquakes : return 60
        case .Buttons:   return 60
        default:         break
        
        }
        return 214
    }
    
    fileprivate func getSlider() -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 1
        slider.isContinuous = true
        switch self {

        case .Magnitude:
            
            slider.maximumValue = NumberConstants.maxMinimumMagnitude
            if let previousValue = NetworkManager.shared.filterData.magnitude {
                slider.value = Float(previousValue)!
            } else { slider.value = slider.maximumValue / 2 }
        case .NumberOfEartquakes:
            
            slider.maximumValue = Float(NumberConstants.maxEarthquakes)
            if let previousValue = NetworkManager.shared.filterData.numberOfEarthquakes {
                slider.value = Float(previousValue)!
            } else { slider.value = 400 }
        default:
            break
        }
                
        return slider
    }
    
    fileprivate func getNumberPicker() -> UIPickerView {
        let picker = UIPickerView()
        picker.tintColor =  Colors.mainColor
        
        return picker
    }
       
    fileprivate func getButtonView() -> UIButton {
        
        let button = UIButton(type: .custom)
        button.backgroundColor = Colors.mainColor
        button.layer.cornerRadius = 9
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Aplicar", for: .normal)
        
        return button
    }
}
