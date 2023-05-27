//
//  Reachability.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 27.05.23.
//
/**
 https://www.youtube.com/watch?v=WjJBRhPiM_I
 */

import Foundation
import Network

final class Network {
    
    static let shared = Network()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    public private(set) var connectionType: ConnectionType = .none
    
    enum ConnectionType {
        case wifi
        case cellular
        case none
    }
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.getConnectionType(path)
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        }
        else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        }
        else {
            connectionType = .none
        }
    }
}
