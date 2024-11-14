//
//  Forecast.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/9/24.
//

struct ForecastModel: Codable {
    
    let currentweather: [CurrentWeatherModel]
    let dailyweather: [DailyWeatherModel]
    let hourlyweather: [HourlyWeatherModel]
    let location: [LocationModel
    ]

    
}
