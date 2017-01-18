//
//  FilterTableViewController.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 14/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import UIKit

protocol FilterProtocolDelegate : class {
    
    func didApply(completion: () -> Void)
    
}

class FilterTableViewController: UITableViewController {

    weak var filterDelegate : FilterProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    fileprivate func setupView() {
        
        self.tableView.register(FiltersTableViewCell.self, forCellReuseIdentifier: CellIds.filterCellId)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.separatorStyle = .singleLine
        self.tableView.allowsSelection = false
        self.tableView.isScrollEnabled = false
        
        let tableHeader = TableHeaderView(frame: CGRect(origin: tableView.frame.origin, size: CGSize(width: tableView.bounds.width, height: 75)))
        tableHeader.closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        self.tableView.tableHeaderView = tableHeader
    
    }
    
    @objc func dismissView(sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return (TableSections(rawValue: indexPath.section)?.height)!
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard section != TableSections.Buttons.rawValue else { return 0 }
        
        return NumberConstants.tableSectionHeadersHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section != TableSections.Buttons.rawValue else { return nil }
        
        let headerView = TableSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: NumberConstants.tableSectionHeadersHeight))
        
        headerView.titleLabel.text = TableSections(rawValue: section)?.title
        
        return headerView
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.tableView.isScrollEnabled = !self.tableView.isScrollEnabled
    }

}

extension FilterTableViewController : FilterCellProtcolDelegate {
 

    func didUpdate(slider: TableSections, with value: String!) {
        
        if (slider == TableSections.Magnitude){
                NetworkManager.shared.filterData.magnitude = value
        } else {
            NetworkManager.shared.filterData.numberOfEarthquakes = value
        }
    }
    
    func didUpdatePicker(component: PickerSource, with value: String!) {
        
        switch component {
        case .Month:
            NetworkManager.shared.filterData.month = (value != nil ? Months.getMonthFrom(string: value)?.number : value)
        case .Year:
            NetworkManager.shared.filterData.year = value
        default:
            break
        }
        
    }
    
    func didPressApplyButton() {
        
        NetworkManager.shared.getEarthquakes()//With(filter: filter)
        
        self.filterDelegate?.didApply(completion: {
            
            self.dismiss(animated: true, completion: {})
        
        })
    }
}
