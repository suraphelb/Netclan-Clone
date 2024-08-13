//
//  SaveButtonCell.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/18/23.
//

import UIKit
class SaveButtonCell: UITableViewCell {
    static let identifier = "SaveButtonCell"
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save & Explore", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.accentColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
