//
//  FilterTableViewController.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit

protocol FilterProtocolDelegate : class {
    
    func didApply(filter: MapFilter, completion: () -> Void)
    
}


class FilterTableViewController: UITableViewController {

    weak var filterDelegate : FilterProtocolDelegate?
    var filterData : MapFilter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filterData = MapFilter()
        setupView()
    }

    fileprivate func setupView() {
        
        self.tableView.register(FiltersTableViewCell.self, forCellReuseIdentifier: CellIds.filterCellId)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.separatorStyle = .singleLine
        self.tableView.allowsSelection = false
        self.tableView.isScrollEnabled = false
        self.tableView.tableHeaderView = TableHeaderView(frame: CGRect(origin: tableView.frame.origin, size: CGSize(width: tableView.bounds.width, height: 75)))
    
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return TableSections.total.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (TableSections(rawValue: section)?.numberOfRows)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: CellIds.filterCellId, for: indexPath) as! FiltersTableViewCell)
        
        cell.delegate = self
        cell.setCellFor(section: TableSections(rawValue: indexPath.section)!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return TableSections(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return (TableSections(rawValue: indexPath.section)?.height)!
        
    }
    
  

}

extension FilterTableViewController : FilterCellProtcolDelegate {
 

    func didUpdate(slider: TableSections, with value: String!) {
        

        switch slider {
        case .Magnitude:
            filterData?.magnitude = value
        case .Depth:
            filterData?.depth = value
        default:
            break
        }
    }
    
    func didUpdatePicker(component: PickerSource, with value: String!) {
        
        switch component {
        case .Month:
            filterData?.month = Months.getMonthFrom(string: value)?.number
        case .numberOfEarthquakes:
            filterData?.numberOfEarthquakes = value
        case .Year:
            filterData?.year = value
        default:
            break
        }
        
    }
    
    func didPressApplyButton() {
        
        guard let filter = filterData else { self.dismiss(animated: true, completion: nil) ; return  }
        
        NetworkManager.shared.getEarthquakesWith(filter: filter)
        
        self.filterDelegate?.didApply(filter: filter, completion: {
            
            self.dismiss(animated: true, completion: {})
        
        })
    }
}
