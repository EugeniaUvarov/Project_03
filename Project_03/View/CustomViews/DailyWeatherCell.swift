//
//  DailyWeatherCellTableViewCell.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/13/24.
//

import UIKit

class DailyWeatherCell: UITableViewCell {
    
    // UI Elements
    var dayLabel: UILabel!
    var lowTempLabel: UILabel!
    var highTempLabel: UILabel!
    var iconImageView: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        dayLabel = UILabel()
        lowTempLabel = UILabel()
        highTempLabel = UILabel()
        iconImageView = UIImageView()

        // Add labels to the content view
        contentView.addSubview(dayLabel)
        contentView.addSubview(lowTempLabel)
        contentView.addSubview(highTempLabel)
        contentView.addSubview(iconImageView)

        // Set up constraints or layout
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            iconImageView.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            lowTempLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            lowTempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            highTempLabel.leadingAnchor.constraint(equalTo: lowTempLabel.trailingAnchor, constant: 10),
            highTempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(day: String, lowTemp: String, highTemp: String, icon: UIImage) {
        dayLabel.text = day
        lowTempLabel.text = lowTemp
        highTempLabel.text = highTemp
        iconImageView.image = icon
    }
}
