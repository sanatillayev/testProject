//
//  UIApplication.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 24/09/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
