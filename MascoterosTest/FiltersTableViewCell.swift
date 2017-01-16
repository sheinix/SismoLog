//
//  FiltersTableViewCell.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 15/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit
import SnapKit

protocol FilterCellProtcolDelegate : class {
    
    func didUpdate(slider: TableSections, with value: String!)
    
    func didUpdatePicker(component: PickerSource, with value: String!)
    
    func didPressApplyButton()
}

class FiltersTableViewCell: UITableViewCell {

    var numberIndicator : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Colors.mainColor
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.isHidden = true
        return label
    }()
    
    weak var delegate : FilterCellProtcolDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.clipsToBounds = true
    }

 
    public func setCellFor(section: TableSections) {
        
        self.tag = section.rawValue
        
        switch section {
        case .Magnitude:
            setupSlider(slider: section.filter as! UISlider)
        case .PickerFilter:
            setupPicker(picker: section.filter as! UIPickerView)
        case .Buttons:
            setupButtons(button: section.filter as! UIButton)
        default:
            break
        }
        
    }
    
    fileprivate func setupSlider(slider : UISlider) {
        
        numberIndicator.isHidden = false
        numberIndicator.text = String(slider.value)
        
        slider.tintColor = Colors.mainColor
        slider.addTarget(self, action: #selector(sliderDidChange), for: .valueChanged)
        
        addSubview(numberIndicator)
        addSubview(slider)
        
        slider.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        numberIndicator.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(slider.snp.right).offset(5)
        }
        
    }
    
    fileprivate func setupPicker(picker : UIPickerView) {
        
        picker.dataSource = self
        picker.delegate = self
        
//        picker.selectRow(Int(PickerSource.numberOfEarthquakes.numberOfRows/2),
//                         inComponent: PickerSource.numberOfEarthquakes.rawValue, animated: false)
//        picker.selectRow(Int(PickerSource.Month.numberOfRows/2),
//                         inComponent: PickerSource.Month.rawValue, animated: false)
//        
//        picker.selectRow(Int(PickerSource.Year.numberOfRows/2),
//                         inComponent: PickerSource.Year.rawValue, animated: false)
        
        addSubview(picker)
        picker.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    fileprivate func setupButtons(button : UIButton) {
        
        button.addTarget(self, action: #selector(didPressFilterButton), for: .touchUpInside)
        
        addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
    }
    
    @objc func sliderDidChange(sender: UISlider!) {
        
        numberIndicator.text = String(sender.value)
        
        self.delegate?.didUpdate(slider: TableSections(rawValue: self.tag)!, with: numberIndicator.text)
    
    }
    
    @objc func didPressFilterButton(sender: UIButton!) {
        
        self.delegate?.didPressApplyButton()
    }
}

extension FiltersTableViewCell : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PickerSource.total.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return (PickerSource(rawValue: component)?.numberOfRows)!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return PickerSource(rawValue: component)?.titleFor(row: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        if component == PickerSource.Month.rawValue { return self.bounds.width / 2 }
        
        return self.bounds.width / 4
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let pickerComponent = PickerSource(rawValue: component)!
        let value =      pickerComponent.titleFor(row: row)

        self.delegate?.didUpdatePicker(component: pickerComponent, with: value)
    }
    
}
