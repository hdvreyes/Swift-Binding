//
//  File.swift
//  GenericsAndBind
//
//  Created by dev on 21/11/2017.
//  Copyright © 2017 dev. All rights reserved.
//

import Foundation

protocol MainViewModel {
    var label: Bind<String?> { get }
    func pushBtn()
}
