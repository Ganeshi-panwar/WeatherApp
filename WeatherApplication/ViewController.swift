//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Mohit Mali on 29/09/23.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var humiditylbl: UILabel!
    @IBOutlet var windlbl: UILabel!
    @IBOutlet var temlbl: UILabel!
    @IBOutlet var countrylbl: UILabel!
    @IBOutlet var resionlbl: UILabel!
    @IBOutlet var updatelba: UILabel!
    
    @IBOutlet var cityNamelbl: UILabel!
    @IBOutlet var CityNametext: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
   // fetchData(location: "")
     
        // Do any additional setup after loading the view.
    }
    func fetchData(location:String){
        
        let apiKey = "a1cf15411d564af491b103713232909"
           let apiUrlString = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(location)&aqi=no"

           guard let url = URL(string: apiUrlString) else {
               print("Invalid URL")
               return
           }

        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
           (data , response , error) in
            guard let data = data , error == nil
            else{
                print("Error Occured While Accessing Data With URL")
                return
            }
            var fullWeatherData:WeatherData?
            do{
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                print(data)
                print(fullWeatherData!)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                      print(json)

            }
            catch{
                print("Error Occured While Decoding JSON into Swift structure\(error)")
            }
            DispatchQueue.main.async {
//            DispatchQueue.main.async { [self] in
//                if CityNametext.text!.isEmpty{
//                    let alert = UIAlertController(title: "Please Enter the city", message: "", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "Ok", style: .cancel)
//                    alert.addAction(action)
//                    self.present(alert, animated: true, completion: nil)
//
//
//
//                }else if CityNametext.text! == ""{
//                    self.updatelba.text = "Updated :\(fullWeatherData!.current.last_updated)"
//                    self.countrylbl.text = "Country :\(fullWeatherData!.location.country)"
//                    self.windlbl.text = "Wind (Km/Hr) :\(fullWeatherData!.current.wind_kph)"
//                    self.resionlbl.text = "Resion :\(fullWeatherData!.location.region)"
//                    self.humiditylbl.text = "Humidity : \(fullWeatherData!.current.humidity)"
//                    self.temlbl.text = "Temperature (Celsius) : \(fullWeatherData!.current.temp_c)"
//                    self.cityNamelbl.text = "Name :\(fullWeatherData!.location.name)"
//
//                }
//                else{
                    
                    self.updatelba.text = "Updated :\(fullWeatherData!.current.last_updated)"
                    self.countrylbl.text = "Country :\(fullWeatherData!.location.country)"
                    self.windlbl.text = "Wind (Km/Hr) :\(fullWeatherData!.current.wind_kph)"
                    self.resionlbl.text = "Resion :\(fullWeatherData!.location.region)"
                    self.humiditylbl.text = "Humidity : \(fullWeatherData!.current.humidity)"
                    self.temlbl.text = "Temperature (Celsius) : \(fullWeatherData!.current.temp_c)"
                self.cityNamelbl.text = "Name :\(fullWeatherData!.location.name)"
            }
        })
        dataTask.resume()
    }

    @IBAction func refreshData(_ sender: UIButton) {
        guard let location = CityNametext.text, !location.isEmpty else {
                let alert = UIAlertController(title: "Please Enter the city", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
            fetchData(location: location)
        cityNamelbl.text = location
 
        }
  

    }

    


// http://api.weatherapi.com/v1/current.json?key=a1cf15411d564af491b103713232909&q=Dehradun&aqi=no
