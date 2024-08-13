//
//  StatusTableViewCell.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/17/23.
//

import UIKit

class StatusTableViewCell: UITableViewCell, UITextViewDelegate {
    static let identifier = "StatusTableViewCell"
    
    let maxCharacterCount = 250
    var currentWordCount = 0
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .accentColor
        textView.text = "   Hi community! I am open to new connections 😊"
//        textView.text = "   "
        textView.layer.cornerRadius = 15
        textView.font = .systemFont(ofSize: 15)
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.accentColor?.cgColor
        textView.backgroundColor = .white
        return textView
    }()
    
    let wordCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.accentColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(statusTextView)
        contentView.addSubview(wordCountLabel)

        NSLayoutConstraint.activate([
            statusTextView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            statusTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            statusTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            statusTextView.heightAnchor.constraint(equalToConstant: 100),
            
            wordCountLabel.topAnchor.constraint(equalTo: statusTextView.bottomAnchor, constant: 7),
            wordCountLabel.trailingAnchor.constraint(equalTo: statusTextView.trailingAnchor),
            wordCountLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        textViewDidChange(statusTextView)
        statusTextView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        currentWordCount = textView.text.count
        if currentWordCount < 3 {
            wordCountLabel.text = "   \(currentWordCount - currentWordCount )/\(maxCharacterCount)"
            textView.text = "   "
        }
        currentWordCount = textView.text.count
        wordCountLabel.text = "\(currentWordCount - 3)/\(maxCharacterCount)"
    }
    
}
