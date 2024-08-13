//
//  ExploreCustomTableViewCell.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/15/23.
//

import UIKit

class ExploreCustomTableViewCell: UITableViewCell {
    static let identifier = "ExploreCustomTableViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "apartment_example2")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GAP Exlusive Store"
        label.textColor = UIColor.accentColor
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ontario, within 2 kms"
        label.textColor = UIColor.accentColor
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private let progressView: RoundedProgressBar = {
        let progressView = RoundedProgressBar()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = UIColor.clear
        progressView.progress = 0.5
        return progressView
    }()
    
    private let callIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "phone.circle.fill")
        imageView.tintColor = UIColor.accentColor
        return imageView
    }()
    
    private let personIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = UIColor.accentColor
        return imageView
    }()
    
    private let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "location.circle.fill")
        imageView.tintColor = UIColor.accentColor
        return imageView
    }()
    
    private let bottomTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hi community! We have great deals for you."
        label.textColor = UIColor.accentColor
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        
        containerView.addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            cellImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -17),
            cellImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -70),
            cellImageView.widthAnchor.constraint(equalToConstant: 100),
            cellImageView.heightAnchor.constraint(equalToConstant: 115)
        ])
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
        
        containerView.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 5),
            progressView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: subTitleLabel.centerXAnchor, constant: 8),
            progressView.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [callIcon, personIcon, locationIcon])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: progressView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: progressView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: cellImageView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        containerView.addSubview(bottomTextLabel)
        NSLayoutConstraint.activate([
            bottomTextLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -25),
            bottomTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23),
            bottomTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class RoundedProgressBar: UIView {
    var trackView: UIView!
    var progressView: UIView!
    
    var progress: CGFloat = 0 {
        didSet {
            updateProgressView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        // Create the track view
        trackView = UIView()
        trackView.backgroundColor = UIColor.lightGray
        trackView.layer.cornerRadius = 5
        trackView.clipsToBounds = true
        addSubview(trackView)
        
        // Create the progress view
        progressView = UIView()
        progressView.backgroundColor = UIColor.progressColor
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        
        addSubview(progressView)
        // Set initial progress
        updateProgressView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update the frames of the subviews
        trackView.frame = bounds
        progressView.frame = CGRect(x: 0, y: 0, width: bounds.width * progress, height: bounds.height)
    }
    
    private func updateProgressView() {
        // Update the frame of the progress view
        progressView.frame = CGRect(x: 0, y: 0, width: bounds.width * progress, height: bounds.height)
    }
}
