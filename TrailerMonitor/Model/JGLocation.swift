/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct JGLocation : Codable {
	let alt : Double!
	let altErr : Double!
	let climb : Double!
	let climbErr : Double!
	let lat : Double!
	let latErr : Double!
	let lon : Double!
	let lonErr : Double!
	let mode : String!
	let sats : Int!
	let speed : Double!
	let speedErr : Double!
	let time : String!
	let timeErr : Double!
	let track : Double!

	enum CodingKeys: String, CodingKey {

		case alt = "alt"
		case altErr = "alt_err"
		case climb = "climb"
		case climbErr = "climb_err"
		case lat = "lat"
		case latErr = "lat_err"
		case lon = "lon"
		case lonErr = "lon_err"
		case mode = "mode"
		case sats = "sats"
		case speed = "speed"
		case speedErr = "speed_err"
		case time = "time"
		case timeErr = "time_err"
		case track = "track"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		alt = try values.decodeIfPresent(Double.self, forKey: .alt)
		altErr = try values.decodeIfPresent(Double.self, forKey: .altErr)
        climb = try values.decodeIfPresent(Double.self, forKey: .climb)!
        climbErr = try values.decodeIfPresent(Double.self, forKey: .climbErr)!
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		latErr = try values.decodeIfPresent(Double.self, forKey: .latErr)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
		lonErr = try values.decodeIfPresent(Double.self, forKey: .lonErr)
		mode = try values.decodeIfPresent(String.self, forKey: .mode)
		sats = try values.decodeIfPresent(Int.self, forKey: .sats)
		speed = try values.decodeIfPresent(Double.self, forKey: .speed)
		speedErr = try values.decodeIfPresent(Double.self, forKey: .speedErr)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		timeErr = try values.decodeIfPresent(Double.self, forKey: .timeErr)
		track = try values.decodeIfPresent(Double.self, forKey: .track)
	}

}
