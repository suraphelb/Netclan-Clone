//
//  RefineViewController.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/13/23.
//

import UIKit

class RefineViewController: UITableViewController {
    
    enum TableSection: Int, CaseIterable {
        case availability = 0,
             status,
             distance,
             pupose,
             button
        
        var sectionName: String? {
            switch self {
            case .availability:
                return "Select Your Availability"
            case .status:
                return "Add Your Status"
            case .distance:
                return "Select Hyperlocal Distance"
            case .pupose:
                return "Select Purpose"
            case .button:
                return nil
            }
        }
    }
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        let backButton = UIBarButtonItem()
            backButton.title = "   Refine"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        view.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(AvailabilityTableViewCell.self, forCellReuseIdentifier: AvailabilityTableViewCell.identifier)
        tableView.register(StatusTableViewCell.self, forCellReuseIdentifier: StatusTableViewCell.identifier)
        tableView.register(DistanceTableViewCell.self, forCellReuseIdentifier: DistanceTableViewCell.identifier)
        tableView.register(PurposeCell.self, forCellReuseIdentifier: PurposeCell.identifier)
        tableView.register(SaveButtonCell.self, forCellReuseIdentifier: SaveButtonCell.identifier)
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        tableView.flashScrollIndicators()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = TableSection(rawValue: indexPath.section)
        switch tableSection {
            
        case .availability:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AvailabilityTableViewCell.identifier, for: indexPath) as? AvailabilityTableViewCell else {return UITableViewCell()}
            return cell
            
        case .status:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StatusTableViewCell.identifier, for: indexPath) as? StatusTableViewCell else {return UITableViewCell()}
            return cell
            
        case .distance:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DistanceTableViewCell.identifier, for: indexPath) as? DistanceTableViewCell else {return UITableViewCell()}
            return cell
            
        case .pupose:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PurposeCell.identifier, for: indexPath) as? PurposeCell else {return UITableViewCell()}
            return cell
            
        case .button:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SaveButtonCell.identifier, for: indexPath) as? SaveButtonCell else {return UITableViewCell()}
            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30))
        headerView.backgroundColor = .white
        
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.width - 32, height: 30))
        titleLabel.backgroundColor = .white
        titleLabel.textColor = UIColor.accentColor
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        if let tableSection = TableSection(rawValue: section) {
            titleLabel.text = tableSection.sectionName
        }
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }

    
}

