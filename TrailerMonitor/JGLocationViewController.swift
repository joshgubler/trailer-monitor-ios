//
//  PowerViewController.swift
//  TrailerMonitor
//
//  Created by Josh Gubler on 3/29/21.
//

import UIKit

class JGLocationViewController: UITableViewController {
    var location: JGLocation! {
        didSet {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.location != nil {
            return 10
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.leftLabel(row: indexPath.row)
        cell.detailTextLabel?.text = self.rightLabel(row: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GPS Data"
    }
    
    func leftLabel(row: Int) -> String {
        switch row {
        case 0:
            return String(format: "Altitude (~%.0f ft)", self.location.altErr)
        case 1:
            return String(format: "Climb (~%.0f ft/hr)", self.location.climbErr * 5280.0)
        case 2:
            return "Grade"
        case 3:
            return String(format: "Latitude (~%.0f ft)", self.location.latErr)
        case 4:
            return String(format: "Longitude (~%.0f ft)", self.location.lonErr)
        case 5:
            return "Mode"
        case 6:
            return "Satelites"
        case 7:
            return String(format: "Speed (~%.0f mph)", self.location.speedErr)
        case 8:
            return "Time (~\(self.location.timeErr ?? 0) s)"
        case 9:
            return "Direction"
        default:
            return "???"
        }
    }
    
    func rightLabel(row: Int) -> String {
        switch row {
        case 0:
            return String(format: "%.0f ft", self.location.alt)
        case 1:
            return String(format: "%.0f ft/hr", self.location.climb * 5280.0)
        case 2:
            return String(format: "%.0f%%", self.location.climb / self.location.speed * 100.0)
        case 3:
            return String(format: "%.9f°", self.location.lat)
        case 4:
            return String(format: "%.9f°", self.location.lon)
        case 5:
            return "\(self.location.mode ?? "0")"
        case 6:
            return "\(self.location.sats ?? 0)"
        case 7:
            return String(format: "%.0f mph", self.location.speed)
        case 8:
            return "\(self.location.time ?? "0")"
        case 9:
            return String(format: "%.0f°", self.location.track)
        default:
            return "???"
        }
    }
}
