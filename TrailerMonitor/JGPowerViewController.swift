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
        if self.power != nil {
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
        cell.textLabel?.text = self.leftLabel(indexPath)
        cell.detailTextLabel?.text = self.rightLabel(indexPath)
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
                return "\(self.power.acChargerAmps ?? 0)"
            case 1:
                return "\(self.power.acChargerKwhToday ?? 0)"
            case 2:
                return "\(self.power.acChargerKwhTotal ?? 0)"
            case 3:
                return "\(self.power.acChargerVoltamps ?? 0)"
            case 4:
                return "\(self.power.acChargerWatts ?? 0)"
            default:
                return "???"
            }
        case acDischargeSection:
            switch indexPath.row {
            case 0:
                return "\(self.power.acDischargeKwhToday ?? 0)"
            case 1:
                return "\(self.power.acDischargeKwhTotal ?? 0)"
            case 2:
                return "\(self.power.acDischargeVoltamps ?? 0)"
            case 3:
                return "\(self.power.acDischargeWatts ?? 0)"
            default:
                return "???"
            }
        case acInputSection:
            switch indexPath.row {
            case 0:
                return "\(self.power.acInputFrequency ?? 0)"
            case 1:
                return "\(self.power.acInputVoltage ?? 0)"
            case 2:
                return "\(self.power.acInputVoltamps ?? 0)"
            case 3:
                return "\(self.power.acInputWatts ?? 0)"
            default:
                return "???"
            }
        case acOutputSection:
            switch indexPath.row {
            case 0:
                return "\(self.power.acOutputAmps ?? 0)"
            case 1:
                return "\(self.power.acOutputFrequency ?? 0)"
            case 2:
                return "\(self.power.acOutputVoltage ?? 0)"
            default:
                return "???"
            }
        case batteryDischargeSection:
            switch indexPath.row {
            case 0:
                return "\(self.power.batteryDischargeKwhToday ?? 0)"
            case 1:
                return "\(self.power.batteryDischargeKwhTotal ?? 0)"
            case 2:
                return "\(self.power.batteryDischargeVoltamps ?? 0)"
            case 3:
                return "\(self.power.batteryDischargeWatts ?? 0)"
            default:
                return "???"
            }
        case batterySection:
            switch indexPath.row {
            case 0:
                return "\(self.power.batteryStateOfCharge ?? 0)"
            case 1:
                return "\(self.power.batteryVoltage ?? 0)"
            case 2:
                return "\(self.power.batteryWatts ?? 0)"
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
                return "\(self.power.inverterAmps ?? 0)"
            case 1:
                return "\(self.power.inverterFanSpeed ?? 0)"
            case 2:
                return String(format: "%.1f", self.power.inverterTemperature)
            case 3:
                return "\(self.power.loadPercentage ?? 0)"
            case 4:
                return "\(self.power.outputVoltamps ?? 0)"
            case 5:
                return "\(self.power.outputWatts ?? 0)"
            default:
                return "???"
            }
        case solarSection:
            switch indexPath.row {
            case 0:
                return "\(self.power.solarChargerFanSpeed ?? 0)"
            case 1:
                return "\(self.power.solarChargerWatts ?? 0)"
            case 2:
                return "\(self.power.solarKwhToday ?? 0)"
            case 3:
                return "\(self.power.solarKwhTotal ?? 0)"
            case 4:
                return "\(self.power.solarVoltage ?? 0)"
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
                return "Watts \(self.power.batteryWatts < 0 ? "(charging)" : "(discharging)")"
            case 3:
                return "\(self.power.batteryOverCharge ?? "0")"
            default:
                return "???"
            }
        case systemSection:
            switch indexPath.row {
            case 0:
                return "\(self.power.status ?? "0")"
            case 1:
                return "\(self.power.checkStep ?? "0")"
            case 2:
                return "\(self.power.constantPowerOk ?? "0")"
            case 3:
                return "\(self.power.dtc ?? 0)"
            case 4:
                return "\(self.power.warningBit ?? 0)"
            case 5:
                return "\(self.power.warningValue ?? 0)"
            case 6:
                return "\(self.power.faultBit ?? 0)"
            case 7:
                return "\(self.power.faultValue ?? 0)"
            case 8:
                return "\(self.power.busVoltage ?? 0) v"
            case 9:
                return "\(self.power.dcOutputVoltage ?? 0) v"
            case 10:
                return String(format: "%.1f °F", self.power.dcdcTemperature)
            case 11:
                return "\(self.power.workTimeTotal ?? 0) s"
            case 12:
                return "\(self.power.productionLineMode ?? "0")"
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
