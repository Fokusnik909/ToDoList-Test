//
//  MainScreenTableViewCell.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import UIKit

protocol MainScreenTableViewCellDelegate: AnyObject {
    func didTapCompliteButton(isCompleted: Bool)
}

final class MainScreenTableViewCell: UITableViewCell {
    static let indentifier = "MainScreenTableViewCell"
    
    weak var delegate: MainScreenTableViewCellDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .yellow
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
        setupLayout()
        completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func isSelectedButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            sender.tintColor = .yellow
        } else {
            sender.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            sender.tintColor = .gray
        }
    }
    
    @objc private func completeButtonTapped(_ sender: UIButton) {
//        guard calendarDate <= Date() else { return }
//
//        guard let tracker else { return }

        completeButton.isSelected.toggle()

        isSelectedButton(sender)
        
        UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        delegate?.didTapCompliteButton(isCompleted: sender.isSelected)
    }
    
    private func setupLayout() {
        contentView.addSubview(completeButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateLabel)
        
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            completeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            completeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            completeButton.widthAnchor.constraint(equalToConstant: 24),
            completeButton.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: completeButton.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with todo: ToDoData) {
        titleLabel.text = todo.todo
        descriptionLabel.text = todo.description
        dateLabel.text = "09/10/24"
        completeButton.isSelected = isSelected
        
    }
}

    
