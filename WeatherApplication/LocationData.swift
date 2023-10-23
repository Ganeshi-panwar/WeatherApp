//
//  LocationData.swift
//  WeatherApplication
//
//  Created by Mohit Mali on 29/09/23.
//

import Foundation
struct LocationData:Codable{
    let region:String
    let country:String
    let name:String
}
struct CurrentData:Codable{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
}
struct WeatherData:Codable{
    let location:LocationData
    let current:CurrentData
}

