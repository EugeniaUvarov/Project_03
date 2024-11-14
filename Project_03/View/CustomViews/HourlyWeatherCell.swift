//
//  HourlyWeatherCellCollectionView.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/13/24.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    
    private let hourLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.textColor = .label
           label.textAlignment = .center
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    private let weatherIconImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupUI()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupUI()
       }
    
    private func setupUI() {
        contentView.addSubview(hourLabel)
        contentView.addSubview(weatherIconImageView)
        contentView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
                    hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                    hourLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    
                    weatherIconImageView.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 8),
                    weatherIconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    weatherIconImageView.widthAnchor.constraint(equalToConstant: 30),
                    weatherIconImageView.heightAnchor.constraint(equalToConstant: 30),
                    
                    temperatureLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 8),
                    temperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
                ])
            }
    
    func configure(hour: String, temperature: String, icon: UIImage) {
           hourLabel.text = hour
           temperatureLabel.text = temperature
           weatherIconImageView.image = icon
       }
}
