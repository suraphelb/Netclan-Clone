//
//  AvailabilityTableViewCell.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/17/23.
//

import UIKit

class AvailabilityTableViewCell: UITableViewCell {
    static let identifier = "AvailabilityTableViewCell"
    
    let dropDownButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false

        // Add the button title label to the content view
        let titleLabel = UILabel()
        titleLabel.text = "Available | Hey Lets Connect"
        titleLabel.textColor = UIColor.accentColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 16)
        
        button.addSubview(titleLabel)
        let padding = 12.0
        titleLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: padding).isActive = true
        titleLabel.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true

        // Add a dropdown icon image view
        let dropdownIcon = UIImageView(image: UIImage(systemName: "arrowtriangle.down.fill"))
        dropdownIcon.contentMode = .scaleAspectFit
        dropdownIcon.tintColor = UIColor.accentColor
        dropdownIcon.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(dropdownIcon)
                
        // Configure constraints for the dropdown icon
        dropdownIcon.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12).isActive = true
        dropdownIcon.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        let iconSize: CGFloat = 14.0
        dropdownIcon.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        dropdownIcon.heightAnchor.constraint(equalToConstant: iconSize).isActive = true

        titleLabel.trailingAnchor.constraint(equalTo: dropdownIcon.leadingAnchor, constant: -8).isActive = true

        // Customize the button's appearance using layer properties
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.accentColor?.cgColor
        button.backgroundColor = .white
        return button
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(dropDownButton)
        NSLayoutConstraint.activate([
            dropDownButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            dropDownButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dropDownButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dropDownButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dropDownButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
