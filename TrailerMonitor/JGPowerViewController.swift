//
//  PowerViewController.swift
//  TrailerMonitor
//
//  Created by Josh Gubler on 3/29/21.
//

import UIKit

class JGPowerViewController: UITableViewController {
    let acChargerSection = 0
    let acDischargeSection = 1
    let acInputSection = 2
    let acOutputSection = 3
    let batteryDischargeSection = 5
    let batterySection = 4
    let systemSection = 8
    let inverterSection = 6
    let solarSection = 7
    
    var power: JGPower! {
        didSet {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if power != nil {
            switch section {
            case acChargerSection:
                return 5
            case acDischargeSection:
                return 4
            case acInputSection:
                return 4
            case acOutputSection:
                return 3
            case batteryDischargeSection:
                return 4
            case batterySection:
                return 4
            case systemSection:
                return 13
            case inverterSection:
                return 6
            case solarSection:
                return 5
            default:
                return 0
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if indexPath.section == systemSection {
            cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)
        }
        cell.textLabel?.text = leftLabel(indexPath)
        cell.detailTextLabel?.text = rightLabel(indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case acChargerSection:
            return "AC Charger"
        case acDischargeSection:
            return "AC Discharge"
        case acInputSection:
            return "AC Input"
        case acOutputSection:
            return "AC Output"
        case batteryDischargeSection:
            return "Battery Discharge"
        case batterySection:
            return "Battery"
        case systemSection:
            return "System"
        case inverterSection:
            return "Inverter"
        case solarSection:
            return "Solar"
        default:
            return "???"
        }
    }
    
    func leftLabel(_ indexPath: IndexPath) -> String {
        switch indexPath.section {
        case acChargerSection:
            switch indexPath.row {
            case 0:
                return "\(power.acChargerAmps ?? 0)"
            case 1:
                return "\(power.acChargerKwhToday ?? 0)"
            case 2:
                return "\(power.acChargerKwhTotal ?? 0)"
            case 3:
                return "\(power.acChargerVoltamps ?? 0)"
            case 4:
                return "\(power.acChargerWatts ?? 0)"
            default:
                return "???"
            }
        case acDischargeSection:
            switch indexPath.row {
            case 0:
                return "\(power.acDischargeKwhToday ?? 0)"
            case 1:
                return "\(power.acDischargeKwhTotal ?? 0)"
            case 2:
                return "\(power.acDischargeVoltamps ?? 0)"
            case 3:
                return "\(power.acDischargeWatts ?? 0)"
            default:
                return "???"
            }
        case acInputSection:
            switch indexPath.row {
            case 0:
                return "\(power.acInputFrequency ?? 0)"
            case 1:
                return "\(power.acInputVoltage ?? 0)"
            case 2:
                return "\(power.acInputVoltamps ?? 0)"
            case 3:
                return "\(power.acInputWatts ?? 0)"
            default:
                return "???"
            }
        case acOutputSection:
            switch indexPath.row {
            case 0:
                return "\(power.acOutputAmps ?? 0)"
            case 1:
                return "\(power.acOutputFrequency ?? 0)"
            case 2:
                return "\(power.acOutputVoltage ?? 0)"
            default:
                return "???"
            }
        case batteryDischargeSection:
            switch indexPath.row {
            case 0:
                return "\(power.batteryDischargeKwhToday ?? 0)"
            case 1:
                return "\(power.batteryDischargeKwhTotal ?? 0)"
            case 2:
                return "\(power.batteryDischargeVoltamps ?? 0)"
            case 3:
                return "\(power.batteryDischargeWatts ?? 0)"
            default:
                return "???"
            }
        case batterySection:
            switch indexPath.row {
            case 0:
                return "\(power.batteryStateOfCharge ?? 0)"
            case 1:
                return "\(power.batteryVoltage ?? 0)"
            case 2:
                return "\(power.batteryWatts ?? 0)"
            case 3:
                return ""
            default:
                return "???"
            }
        case systemSection:
            switch indexPath.row {
            case 0:
                return "Mode"
            case 1:
                return "Check Step"
            case 2:
                return "Constant Power Status"
            case 3:
                return "Device Type Code"
            case 4:
                return "Warning Bit"
            case 5:
                return "Warning Value"
            case 6:
                return "Fault Bit"
            case 7:
                return "Fault Value"
            case 8:
                return "Bus Voltage"
            case 9:
                return "DC Output Voltage"
            case 10:
                return "DC-DC Temp"
            case 11:
                return "Work Time Total"
            case 12:
                return ""
            default:
                return "???"
            }
        case inverterSection:
            switch indexPath.row {
            case 0:
                return "\(power.inverterAmps ?? 0)"
            case 1:
                return "\(power.inverterFanSpeed ?? 0)"
            case 2:
                return String(format: "%.1f", power.inverterTemperature)
            case 3:
                return "\(power.loadPercentage ?? 0)"
            case 4:
                return "\(power.outputVoltamps ?? 0)"
            case 5:
                return "\(power.outputWatts ?? 0)"
            default:
                return "???"
            }
        case solarSection:
            switch indexPath.row {
            case 0:
                return "\(power.solarChargerFanSpeed ?? 0)"
            case 1:
                return "\(power.solarChargerWatts ?? 0)"
            case 2:
                return "\(power.solarKwhToday ?? 0)"
            case 3:
                return "\(power.solarKwhTotal ?? 0)"
            case 4:
                return "\(power.solarVoltage ?? 0)"
            default:
                return "???"
            }
        default:
            return "???"
        }
    }
    
    func rightLabel(_ indexPath: IndexPath) -> String {
        switch indexPath.section {
        case acChargerSection:
            switch indexPath.row {
            case 0:
                return "Amps"
            case 1:
                return "KWH Today"
            case 2:
                return "KWH Total"
            case 3:
                return "Volt-Amps"
            case 4:
                return "Watts"
            default:
                return "???"
            }
        case acDischargeSection:
            switch indexPath.row {
            case 0:
                return "KWH Today"
            case 1:
                return "KWH Total"
            case 2:
                return "Volt-Amps"
            case 3:
                return "Watts"
            default:
                return "???"
            }
        case acInputSection:
            switch indexPath.row {
            case 0:
                return "Hertz"
            case 1:
                return "Volts"
            case 2:
                return "Volt-Amps"
            case 3:
                return "Watts"
            default:
                return "???"
            }
        case acOutputSection:
            switch indexPath.row {
            case 0:
                return "Amps"
            case 1:
                return "Hertz"
            case 2:
                return "Volts"
            default:
                return "???"
            }
        case batteryDischargeSection:
            switch indexPath.row {
            case 0:
                return "KWH Today"
            case 1:
                return "KWH Total"
            case 2:
                return "Volt-Amps"
            case 3:
                return "Watts"
            default:
                return "???"
            }
        case batterySection:
            switch indexPath.row {
            case 0:
                return "% Charged"
            case 1:
                return "Volts"
            case 2:
                let status = power.batteryWatts < 0 ? "(charging)" : power.batteryWatts > 0 ? "(discharging)" : ""
                return "Watts \(status)"
            case 3:
                return "\(power.batteryOverCharge ?? "0")"
            default:
                return "???"
            }
        case systemSection:
            switch indexPath.row {
            case 0:
                return "\(power.status ?? "0")"
            case 1:
                return "\(power.checkStep ?? "0")"
            case 2:
                return "\(power.constantPowerOk ?? "0")"
            case 3:
                return "\(power.dtc ?? 0)"
            case 4:
                return "\(power.warningBit ?? 0)"
            case 5:
                return "\(power.warningValue ?? 0)"
            case 6:
                return "\(power.faultBit ?? 0)"
            case 7:
                return "\(power.faultValue ?? 0)"
            case 8:
                return "\(power.busVoltage ?? 0) v"
            case 9:
                return "\(power.dcOutputVoltage ?? 0) v"
            case 10:
                return String(format: "%.1f °F", power.dcdcTemperature)
            case 11:
                return "\(power.workTimeTotal ?? 0) s"
            case 12:
                return "\(power.productionLineMode ?? "0")"
            default:
                return "???"
            }
        case inverterSection:
            switch indexPath.row {
            case 0:
                return "Amps"
            case 1:
                return "% Fan Speed"
            case 2:
                return "°F"
            case 3:
                return "% Load Capacity"
            case 4:
                return "Volt-Amps"
            case 5:
                return "Watts"
            default:
                return "???"
            }
        case solarSection:
            switch indexPath.row {
            case 0:
                return "% Fan Speed"
            case 1:
                return "Watts"
            case 2:
                return "KWH Today"
            case 3:
                return "KWH Total"
            case 4:
                return "Volts"
            default:
                return "???"
            }
        default:
            return "???"
        }
    }
    
}
