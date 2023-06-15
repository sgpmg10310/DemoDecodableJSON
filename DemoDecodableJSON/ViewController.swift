//
//  ViewController.swift
//  DemoDecodableJSON
//
//  Created by JONG DEOK KIM on 2020/12/11.
//

import UIKit

class ViewController: UIViewController {

    //이런 형식의 JSON데이터를 파싱하기 위한 기초 데이터
    let json = """
    {
        "flight_number": 65,
        "mission_name": "Telstar 19V",
        "launch_date_unix": 1532238600,
        "launch_success": true
    }
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        do {
            let launch = try decoder.decode(Launch.self, from: jsonData)
            print(launch)
        } catch {
            print(error)
        }
        
        
    }


}

struct Launch: Decodable {
    let flightNumber: Int
    let missionName: String
    let launchDateUnix: Date
    let launchSuccess: Bool
}
