//
//  UserDefaults.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.06.23.
//

import Foundation

public var isDarkMode: Bool {
    get {
        return UserDefaults.standard.bool(forKey: Constants.UserDefaults.key)
    }
    set {
        UserDefaults.standard.set(newValue, forKey: Constants.UserDefaults.key)
    }
}

private enum Constants {
    enum UserDefaults {
        static let key = "DarkModeEnabled"
    }
}

