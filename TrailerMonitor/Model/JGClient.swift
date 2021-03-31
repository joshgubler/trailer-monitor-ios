//
//  Client.swift
//  TrailerMonitor
//
//  Created by Josh Gubler on 3/29/21.
//

import Foundation

protocol JGClientDelegate {
    func onPowerData(_ power:JGPower)
    func onLocationData(_ location:JGLocation)
}

class JGClient: NSObject {
    var delegate: JGClientDelegate?
    var webSocketTask: URLSessionWebSocketTask!
    var url: URL!
    var urlSession: URLSession!
    var timer: Timer!

    init(url: URL) {
        super.init()
        self.url = url
        urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession.webSocketTask(with: url)
    }
        
    func connect() {
        webSocketTask.resume()
        readMessage()
        if timer != nil {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if self.webSocketTask.state != .running {
                self.webSocketTask = self.urlSession.webSocketTask(with: self.url)
                self .connect()
            }
        }
    }
    
    func disconnect() {
        webSocketTask.cancel(with: .goingAway, reason: nil)
    }
    
    func readMessage() {
        webSocketTask.receive { result in
            switch result {
            case .failure(let error):
                print("Failed to receive message: \(error)")
            case .success(let message):
                switch message {
                case .data(let data):
                  self.handleMessage(data)
                case .string(let str):
                  guard let data = str.data(using: .utf8) else { return }
                  self.handleMessage(data)
                @unknown default:
                    fatalError()
                }
                
                self.readMessage()
            }
        }
    }
    
    func handleMessage(_ data: Data) {
        do {
            let message = try JSONDecoder().decode(JGMessage.self, from: data)
            if let location = message.location {
                self.delegate?.onLocationData(location)
            }
            if let power = message.power {
                self.delegate?.onPowerData(power)
            }
        } catch {
            print("Failed to decode message: \(error)")
        }
    }
        
}
