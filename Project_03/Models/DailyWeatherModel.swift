//
//  DailyWeather.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/9/24.
//


struct DailyWeatherModel: Codable {
    let lowtemp: Double
    let hightemp: Double
    let day: String
    let icon: String
}
