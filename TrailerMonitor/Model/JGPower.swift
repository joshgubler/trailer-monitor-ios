/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct JGPower : Codable {
	let acChargerAmps : Double!
	let acChargerKwhToday : Double!
	let acChargerKwhTotal : Double!
	let acChargerVoltamps : Int!
	let acChargerWatts : Int!
	let acDischargeKwhToday : Double!
	let acDischargeKwhTotal : Double!
	let acDischargeVoltamps : Int!
	let acDischargeWatts : Int!
	let acInputFrequency : Double!
	let acInputVoltage : Double!
	let acInputVoltamps : Int!
	let acInputWatts : Int!
	let acOutputAmps : Double!
	let acOutputFrequency : Double!
	let acOutputVoltage : Double!
	let batteryDischargeKwhToday : Double!
	let batteryDischargeKwhTotal : Double!
	let batteryDischargeVoltamps : Int!
	let batteryDischargeWatts : Int!
	let batteryOverCharge : String!
	let batteryStateOfCharge : Int!
	let batteryVoltage : Double!
	let batteryWatts : Int!
	let busVoltage : Double!
	let checkStep : String!
	let constantPowerOk : String!
	let dcOutputVoltage : Double!
	let dcdcTemperature : Double!
	let dtc : Int!
	let faultBit : Int!
	let faultValue : Int!
	let inverterAmps : Double!
	let inverterFanSpeed : Int!
	let inverterTemperature : Double!
	let loadPercentage : Double!
	let outputVoltamps : Int!
	let outputWatts : Int!
	let productionLineMode : String!
	let solarChargerFanSpeed : Int!
	let solarChargerWatts : Int!
	let solarKwhToday : Double!
	let solarKwhTotal : Double!
	let solarVoltage : Double!
	let status : String!
	let warningBit : Int!
	let warningValue : Int!
	let workTimeTotal : Int!

	enum CodingKeys: String, CodingKey {

		case acChargerAmps = "ac_charger_amps"
		case acChargerKwhToday = "ac_charger_kwh_today"
		case acChargerKwhTotal = "ac_charger_kwh_total"
		case acChargerVoltamps = "ac_charger_voltamps"
		case acChargerWatts = "ac_charger_watts"
		case acDischargeKwhToday = "ac_discharge_kwh_today"
		case acDischargeKwhTotal = "ac_discharge_kwh_total"
		case acDischargeVoltamps = "ac_discharge_voltamps"
		case acDischargeWatts = "ac_discharge_watts"
		case acInputFrequency = "ac_input_frequency"
		case acInputVoltage = "ac_input_voltage"
		case acInputVoltamps = "ac_input_voltamps"
		case acInputWatts = "ac_input_watts"
		case acOutputAmps = "ac_output_amps"
		case acOutputFrequency = "ac_output_frequency"
		case acOutputVoltage = "ac_output_voltage"
		case batteryDischargeKwhToday = "battery_discharge_kwh_today"
		case batteryDischargeKwhTotal = "battery_discharge_kwh_total"
		case batteryDischargeVoltamps = "battery_discharge_voltamps"
		case batteryDischargeWatts = "battery_discharge_watts"
		case batteryOverCharge = "battery_over_charge"
		case batteryStateOfCharge = "battery_state_of_charge"
		case batteryVoltage = "battery_voltage"
		case batteryWatts = "battery_watts"
		case busVoltage = "bus_voltage"
		case checkStep = "check_step"
		case constantPowerOk = "constant_power_ok"
		case dcOutputVoltage = "dc_output_voltage"
		case dcdcTemperature = "dcdc_temperature"
		case dtc = "dtc"
		case faultBit = "fault_bit"
		case faultValue = "fault_value"
		case inverterAmps = "inverter_amps"
		case inverterFanSpeed = "inverter_fan_speed"
		case inverterTemperature = "inverter_temperature"
		case loadPercentage = "load_percentage"
		case outputVoltamps = "output_voltamps"
		case outputWatts = "output_watts"
		case productionLineMode = "production_line_mode"
		case solarChargerFanSpeed = "solar_charger_fan_speed"
		case solarChargerWatts = "solar_charger_watts"
		case solarKwhToday = "solar_kwh_today"
		case solarKwhTotal = "solar_kwh_total"
		case solarVoltage = "solar_voltage"
		case status = "status"
		case warningBit = "warning_bit"
		case warningValue = "warning_value"
		case workTimeTotal = "work_time_total"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		acChargerAmps = try values.decode(Double.self, forKey: .acChargerAmps)
		acChargerKwhToday = try values.decodeIfPresent(Double.self, forKey: .acChargerKwhToday)
		acChargerKwhTotal = try values.decodeIfPresent(Double.self, forKey: .acChargerKwhTotal)
		acChargerVoltamps = try values.decodeIfPresent(Int.self, forKey: .acChargerVoltamps)
		acChargerWatts = try values.decodeIfPresent(Int.self, forKey: .acChargerWatts)
		acDischargeKwhToday = try values.decodeIfPresent(Double.self, forKey: .acDischargeKwhToday)
		acDischargeKwhTotal = try values.decodeIfPresent(Double.self, forKey: .acDischargeKwhTotal)
		acDischargeVoltamps = try values.decodeIfPresent(Int.self, forKey: .acDischargeVoltamps)
		acDischargeWatts = try values.decodeIfPresent(Int.self, forKey: .acDischargeWatts)
		acInputFrequency = try values.decodeIfPresent(Double.self, forKey: .acInputFrequency)
		acInputVoltage = try values.decodeIfPresent(Double.self, forKey: .acInputVoltage)
		acInputVoltamps = try values.decodeIfPresent(Int.self, forKey: .acInputVoltamps)
		acInputWatts = try values.decodeIfPresent(Int.self, forKey: .acInputWatts)
		acOutputAmps = try values.decodeIfPresent(Double.self, forKey: .acOutputAmps)
		acOutputFrequency = try values.decodeIfPresent(Double.self, forKey: .acOutputFrequency)
		acOutputVoltage = try values.decodeIfPresent(Double.self, forKey: .acOutputVoltage)
		batteryDischargeKwhToday = try values.decodeIfPresent(Double.self, forKey: .batteryDischargeKwhToday)
		batteryDischargeKwhTotal = try values.decodeIfPresent(Double.self, forKey: .batteryDischargeKwhTotal)
		batteryDischargeVoltamps = try values.decodeIfPresent(Int.self, forKey: .batteryDischargeVoltamps)
		batteryDischargeWatts = try values.decodeIfPresent(Int.self, forKey: .batteryDischargeWatts)
		batteryOverCharge = try values.decodeIfPresent(String.self, forKey: .batteryOverCharge)
		batteryStateOfCharge = try values.decodeIfPresent(Int.self, forKey: .batteryStateOfCharge)
		batteryVoltage = try values.decodeIfPresent(Double.self, forKey: .batteryVoltage)
		batteryWatts = try values.decodeIfPresent(Int.self, forKey: .batteryWatts)
		busVoltage = try values.decodeIfPresent(Double.self, forKey: .busVoltage)
		checkStep = try values.decodeIfPresent(String.self, forKey: .checkStep)
		constantPowerOk = try values.decodeIfPresent(String.self, forKey: .constantPowerOk)
		dcOutputVoltage = try values.decodeIfPresent(Double.self, forKey: .dcOutputVoltage)
		dcdcTemperature = try values.decodeIfPresent(Double.self, forKey: .dcdcTemperature)
		dtc = try values.decodeIfPresent(Int.self, forKey: .dtc)
		faultBit = try values.decodeIfPresent(Int.self, forKey: .faultBit)
		faultValue = try values.decodeIfPresent(Int.self, forKey: .faultValue)
		inverterAmps = try values.decodeIfPresent(Double.self, forKey: .inverterAmps)
		inverterFanSpeed = try values.decodeIfPresent(Int.self, forKey: .inverterFanSpeed)
		inverterTemperature = try values.decodeIfPresent(Double.self, forKey: .inverterTemperature)
		loadPercentage = try values.decodeIfPresent(Double.self, forKey: .loadPercentage)
		outputVoltamps = try values.decodeIfPresent(Int.self, forKey: .outputVoltamps)
		outputWatts = try values.decodeIfPresent(Int.self, forKey: .outputWatts)
		productionLineMode = try values.decodeIfPresent(String.self, forKey: .productionLineMode)
		solarChargerFanSpeed = try values.decodeIfPresent(Int.self, forKey: .solarChargerFanSpeed)
		solarChargerWatts = try values.decodeIfPresent(Int.self, forKey: .solarChargerWatts)
		solarKwhToday = try values.decodeIfPresent(Double.self, forKey: .solarKwhToday)
		solarKwhTotal = try values.decodeIfPresent(Double.self, forKey: .solarKwhTotal)
		solarVoltage = try values.decodeIfPresent(Double.self, forKey: .solarVoltage)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		warningBit = try values.decodeIfPresent(Int.self, forKey: .warningBit)
		warningValue = try values.decodeIfPresent(Int.self, forKey: .warningValue)
		workTimeTotal = try values.decodeIfPresent(Int.self, forKey: .workTimeTotal)
	}

}
