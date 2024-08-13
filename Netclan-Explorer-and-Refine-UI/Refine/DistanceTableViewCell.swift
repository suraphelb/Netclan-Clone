//
//  DistanceTableViewCell.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/17/23.
//

import UIKit

class DistanceTableViewCell: UITableViewCell {
    static let identifier = "DistanceTableViewCell"
    
    private let hyperlocalDistanceSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.tintColor = UIColor.accentColor
        return slider
    }()
    
    private let minValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.accentColor
        label.font = .systemFont(ofSize: 14)
        label.text = "1 km"
        return label
    }()
    
    private let maxValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.accentColor
        label.font = .systemFont(ofSize: 14)
        label.text = "100 km"
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(hyperlocalDistanceSlider)
        contentView.addSubview(minValue)
        contentView.addSubview(maxValue)
        contentView.backgroundColor = .white
        NSLayoutConstraint.activate([
            hyperlocalDistanceSlider.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            hyperlocalDistanceSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hyperlocalDistanceSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            minValue.topAnchor.constraint(equalTo: hyperlocalDistanceSlider.bottomAnchor, constant: 5),
            minValue.leadingAnchor.constraint(equalTo: hyperlocalDistanceSlider.leadingAnchor),
            minValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            maxValue.topAnchor.constraint(equalTo: minValue.topAnchor),
            maxValue.trailingAnchor.constraint(equalTo: hyperlocalDistanceSlider.trailingAnchor),
            maxValue.bottomAnchor.constraint(equalTo: minValue.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
