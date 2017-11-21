//
//  MainViewViewModel.swift
//  GenericsAndBind
//
//  Created by dev on 21/11/2017.
//  Copyright © 2017 dev. All rights reserved.
//

import Foundation
class MainViewViewModel: NSObject, MainViewModel {
    let sample:Sample
    let label: Bind<String?>
    var hello: Bind<String?>
    
    init(_ sample: Sample) {
        self.sample = sample
        self.label = Bind(nil)
        self.hello = Bind("Nil")
        super.init()
    }
    
    func pushBtn() {
        print("hello")

        self.label.value = "New Test"
        //self.hello.value = "Hey There!"

    }
    
    func anotherPush(_ params:String){

        print("Another push")
        self.hello.value = params

        //sleep(3)
        //self.hello.value = params
    }
}
