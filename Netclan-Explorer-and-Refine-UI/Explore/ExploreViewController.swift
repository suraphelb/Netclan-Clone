//
//  ExploreViewController.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/13/23.
//

import UIKit

class ExploreViewController: UIViewController, UITextFieldDelegate {
    
    let width = UIScreen.main.bounds.width / 3  // each buttonSegment width
    
    var segmentIndicatorLeadingConstraint: NSLayoutConstraint!
    var segmentIndicatorWidthConstraint: NSLayoutConstraint!
    
    private let checklistImageView: UIImageView = {
       let checklistImageView = UIImageView(image: UIImage(systemName: "checklist"))
        checklistImageView.contentMode = .scaleAspectFit
        checklistImageView.isUserInteractionEnabled = true
        return checklistImageView
    }()

    private let segmentIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let individualButton: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Personal", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = UIColor.accentColor
        button.tag = 0
        return button
    }()
    
    private let professionalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Business", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.backgroundColor = UIColor.accentColor
        button.tag = 1
        return button
    }()
    
    private let merchantButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Merchant", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.backgroundColor = UIColor.accentColor
        button.tag = 2
        return button
    }()
    
    private let horizontalLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.layerColor
        return view
    }()
    
    private let buttonSegmentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.accentColor
        return view
    }()
    
    private let searchContainerView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 35/2 - 1.5
        return label
    }()
    
    private let searchTextField: DesignableUITextField = {
        let textField = DesignableUITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.borderStyle = .none
        textField.leftImage = UIImage(systemName: "magnifyingglass")
        
        // Create an attributed string with the desired text color
        let attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        // Assign the attributed string to the text field's attributedPlaceholder property
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }()
    
    private let toogleImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "mapViewIcon")?.withTintColor(UIColor.accentColor!)
        button.setImage(image, for: .normal)
        button.scalesLargeContentImage = true
        return button
    }()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExploreCustomTableViewCell.self, forCellReuseIdentifier: ExploreCustomTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        addViews()
        applyConstraints()
        setupSegmentedControlButtonActions()
        
        addSearchBar()
        setupTableView()
    }
    
    @objc private func humbergurMenuButtonTapped() {
        // Handle left bar button item tap event
        print("humbergur menu button tapped")
    }
    
    @objc private func rightMenuButtonTapped() {
        // Handle right bar button tap event
        print("notification bar button tapped")
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        individualButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        professionalButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        merchantButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        individualButton.isSelected = false
        professionalButton.isSelected = false
        merchantButton.isSelected = false
        
        sender.isSelected = true
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        updateSegmentIndicatorPosition(index: sender.tag)
    }
    
    @objc private func toogleImageButtonTapped() {
        // Handle the toogleImageButton tap event here
        print("toogleImageButton tapped")
    }
    
    @objc private func openRefineViewController() {
        let refineViewController = RefineViewController(style: .grouped)
        navigationController?.pushViewController(refineViewController, animated: true)
    }
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreCustomTableViewCell.identifier, for: indexPath) as? ExploreCustomTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ExploreViewController {
    
    private func addSearchBar() {
        searchTextField.delegate = self
        toogleImageButton.addTarget(self, action: #selector(toogleImageButtonTapped), for: .touchUpInside)
        
        view.addSubview(toogleImageButton)
        NSLayoutConstraint.activate([
            toogleImageButton.topAnchor.constraint(equalTo: segmentIndicator.bottomAnchor, constant: 35),
            toogleImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            toogleImageButton.widthAnchor.constraint(equalToConstant: 40),
            toogleImageButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        view.addSubview(searchContainerView)
        NSLayoutConstraint.activate([
            searchContainerView.topAnchor.constraint(equalTo: toogleImageButton.topAnchor, constant: 2.5),
            searchContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchContainerView.trailingAnchor.constraint(equalTo: toogleImageButton.leadingAnchor, constant: -15),
            searchContainerView.bottomAnchor.constraint(equalTo: toogleImageButton.bottomAnchor, constant: -2.5),
        ])
        
        searchContainerView.addSubview(searchTextField)
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchContainerView.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchContainerView.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchContainerView.trailingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
        ])
        
    }
    
    private func addViews() {
        view.backgroundColor = .white
        view.addSubview(horizontalLayer)
        view.addSubview(buttonSegmentContainerView)
        buttonSegmentContainerView.addSubview(individualButton)
        buttonSegmentContainerView.addSubview(professionalButton)
        buttonSegmentContainerView.addSubview(merchantButton)
        buttonSegmentContainerView.addSubview(segmentIndicator)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            horizontalLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalLayer.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
        var constraits = [
            buttonSegmentContainerView.topAnchor.constraint(equalTo: horizontalLayer.bottomAnchor),
            buttonSegmentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonSegmentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraits)
        
        constraits = [
            individualButton.topAnchor.constraint(equalTo: buttonSegmentContainerView.topAnchor, constant: 15),
            individualButton.leadingAnchor.constraint(equalTo: buttonSegmentContainerView.leadingAnchor),
            individualButton.widthAnchor.constraint(equalTo: buttonSegmentContainerView.widthAnchor, multiplier: 1/3),
            
            professionalButton.topAnchor.constraint(equalTo: individualButton.topAnchor),
            professionalButton.leadingAnchor.constraint(equalTo: individualButton.trailingAnchor),
            professionalButton.widthAnchor.constraint(equalTo: buttonSegmentContainerView.widthAnchor, multiplier: 1/3),
            
            merchantButton.topAnchor.constraint(equalTo: individualButton.topAnchor),
            merchantButton.leadingAnchor.constraint(equalTo: professionalButton.trailingAnchor),
            merchantButton.trailingAnchor.constraint(equalTo: buttonSegmentContainerView.trailingAnchor),
            merchantButton.widthAnchor.constraint(equalTo: buttonSegmentContainerView.widthAnchor, multiplier: 1/3),
        ]
        NSLayoutConstraint.activate(constraits)
        
        
        segmentIndicatorLeadingConstraint = segmentIndicator.leadingAnchor.constraint(equalTo: individualButton.leadingAnchor)
        segmentIndicatorLeadingConstraint.isActive = true
        
        segmentIndicator.topAnchor.constraint(equalTo: individualButton.bottomAnchor, constant: 5).isActive = true
        segmentIndicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        segmentIndicatorWidthConstraint = segmentIndicator.widthAnchor.constraint(equalToConstant: width)
        segmentIndicatorWidthConstraint.isActive = true
        
        segmentIndicator.bottomAnchor.constraint(equalTo: buttonSegmentContainerView.bottomAnchor, constant: -1).isActive = true
    }
    
    private func setupSegmentedControlButtonActions() {
        individualButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        professionalButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        merchantButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private func updateSegmentIndicatorPosition(index: Int) {
        segmentIndicatorWidthConstraint.constant = width
        
        switch index {
        case 0:
            segmentIndicatorLeadingConstraint.constant = 0
        case 1:
            segmentIndicatorLeadingConstraint.constant = width
        case 2:
            segmentIndicatorLeadingConstraint.constant = (2 * width) + 5
        default:
            break
        }
        animateSegmentIndicator()
    }
    
    private func animateSegmentIndicator() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.segmentIndicator.transform = CGAffineTransform(scaleX: 0.5, y: 1)
        }) { (finish) in
            UIView.animate(withDuration: 0.4, animations: {
                self.segmentIndicator.transform = CGAffineTransform.identity
            })
        }
    }
    
    private func configureNavBar() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openRefineViewController))
        checklistImageView.addGestureRecognizer(tapGesture)
        
        let humburgerMenuImage = UIImage(systemName: "line.horizontal.3")
        
        let titleLabel = UILabel()
        titleLabel.text = "Howdy Suraphel Birhane !!"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14, weight: .heavy)
        
        let locationIcon = UIImageView()
        locationIcon.contentMode = .scaleAspectFit
        locationIcon.image = UIImage(named: "LocationTag")?.withTintColor(.white)
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Ontario, California"
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        
        let locationStackView = UIStackView(arrangedSubviews: [locationIcon, subtitleLabel])
        locationStackView.axis = .horizontal
        locationStackView.spacing = 1
        
        let titleAndSubtitleStackView = UIStackView(arrangedSubviews: [titleLabel, locationStackView])
        titleAndSubtitleStackView.axis = .vertical
        titleAndSubtitleStackView.spacing = 2
        titleAndSubtitleStackView.alignment = .leading
        
        let customLeftView = UIBarButtonItem(customView: titleAndSubtitleStackView)
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: humburgerMenuImage,
                            style: .plain,
                            target: self,
                            action: #selector(humbergurMenuButtonTapped)),
            customLeftView
        ]

        // Create a label for the title
        let refineSubtitleLabel = UILabel(frame: CGRect(x: 0, y: 60, width: 60, height: 20))
        refineSubtitleLabel.text = "Refine"
        refineSubtitleLabel.textAlignment = .center
        refineSubtitleLabel.font = UIFont.systemFont(ofSize: 12) // Adjust font size as needed
        refineSubtitleLabel.textColor = UIColor.white // Adjust text color as needed

        // Create a bar button item with the custom view
        let refineButtonStackView = UIStackView(arrangedSubviews: [checklistImageView, refineSubtitleLabel])
        refineButtonStackView.axis = .vertical
        refineButtonStackView.spacing = 5
        let refineButton = UIBarButtonItem(customView: refineButtonStackView)

        // Add the button to your navigation bar or toolbar
        navigationItem.rightBarButtonItem = refineButton

        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "AccentColor")
    }

    
}
