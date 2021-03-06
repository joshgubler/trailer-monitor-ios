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
        if location != nil {
            return 9
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = leftLabel(row: indexPath.row)
        cell.detailTextLabel?.text = rightLabel(row: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GPS Data"
    }
    
    func leftLabel(row: Int) -> String {
        switch row {
        case 0:
            return String(format: "Altitude (~%.0f ft)", location.altErr)
        case 1:
            return String(format: "Climb (~%.0f ft/hr)", location.climbErr * 5280.0)
        case 2:
            return String(format: "Latitude (~%.0f ft)", location.latErr)
        case 3:
            return String(format: "Longitude (~%.0f ft)", location.lonErr)
        case 4:
            return "Mode"
        case 5:
            return "Satelites"
        case 6:
            return String(format: "Speed (~%.0f mph)", location.speedErr)
        case 7:
            return "Time (~\(location.timeErr ?? 0) s)"
        case 8:
            return "Direction"
        default:
            return "???"
        }
    }
    
    func rightLabel(row: Int) -> String {
        switch row {
        case 0:
            return String(format: "%.0f ft", location.alt)
        case 1:
            return String(format: "%.0f ft/hr", location.climb * 5280.0)
        case 2:
            return String(format: "%.9f??", location.lat)
        case 3:
            return String(format: "%.9f??", location.lon)
        case 4:
            return "\(location.mode ?? "0")"
        case 5:
            return "\(location.sats ?? 0)"
        case 6:
            return String(format: "%.0f mph", location.speed)
        case 7:
            return "\(location.time ?? "0")"
        case 8:
            return String(format: "%.0f??", location.track)
        default:
            return "???"
        }
    }
}
