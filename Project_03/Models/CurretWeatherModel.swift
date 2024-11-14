//
//  CurretWeather.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/9/24.
//


struct CurrentWeatherModel: Codable {
    
    let temperature: Double
    let city: String
    let time: String
    let condition: String
    let lowtemperature: Double
    let hightemperature: Double
    let feelsLike: Double
    let humidity: Int
    let precipitation: Double
    let visibility: Double
    let wind: Int
    let pressure: Int
    
}
