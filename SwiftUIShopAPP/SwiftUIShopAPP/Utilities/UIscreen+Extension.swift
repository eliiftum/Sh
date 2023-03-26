//
//  UIscreen+Extension.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 31.01.2023.
//

import Foundation
import UIKit

extension UIScreen { // extension class ve strucklara ek bilgi (genişletilmiş class ya da struck diyebiliriz.)
    // var olan bir class ya da struct üzerinde yeni özellikler bulundurmak istiyorsak bunları o yapılara extension yazarak oluşturabiliriz.
    static let width  = UIScreen.main.bounds.width
    static let height  =  UIScreen.main.bounds.height
}
