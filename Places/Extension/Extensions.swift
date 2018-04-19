//
//  Extensions.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
extension String {

    func localizedFromTable(tableName:String) -> String{
        return Bundle.main.localizedString(forKey: self, value: "", table: tableName)
    }
}
extension NSNumber {
    public static func getPropotionalValueDevice() -> NSNumber{
        let screenSize: CGRect = UIScreen.main.bounds
        let valueScreen:CGFloat = screenSize.size.height
        let integer:NSInteger = Int(valueScreen)
        switch integer {
            
        case 480:
            return 0.845;//4S
        case 568:
            return 1;//5S
        case 667:
            return 1.174;//
        case 736:
            return 1.295;//6Plus
        case 812:
            return 1.174;//6Plus
        case 1024:
            return 1;//iPad
        case 1112:
            return 1.0859
        case 1366:
            return 1.334;//iPad Pro
        case 1536:
            return 1.5;
        default:
            return 1;//iPad
            
        }
    }
}
