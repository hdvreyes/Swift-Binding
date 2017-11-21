//
//  MainViewController.swift
//  GenericsAndBind
//
//  Created by dev on 21/11/2017.
//  Copyright © 2017 dev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var testBtn:UIButton?
    var testLabel:UILabel?
    
    var viewModel: MainViewViewModel? {
        didSet {
            changeLabelValue()
        }
    }
    
    var viewViewModel: MainViewViewModel? {
        didSet {
            changeLabelContent()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main")
        viewViewModel = MainViewViewModel(Sample(newLabel: "Hello"))
        viewModel = MainViewViewModel(Sample(newLabel: "Hello"))

        setupUI()
        setupUIElements()
        changeLabelValue()
        changeLabelContent()

    }
    
    fileprivate func setupUI(){
        self.view.backgroundColor = .white
    }

    fileprivate func setupUIElements(){
        self.testBtn = UIButton(frame:CGRect(x:50, y:50, width:100, height:50))
        self.testBtn?.setTitle("Click Me!", for: .normal)
        self.testBtn?.addTarget(self, action: #selector(trigger), for: .touchUpInside)
        self.testBtn?.center = self.view.center
        
        self.testLabel = UILabel(frame:CGRect(x:10, y:100, width:100, height:50))
        self.testLabel?.text = "Sample"
        self.testLabel?.center = (self.testBtn?.center)!
        self.view.addSubview(self.testLabel!)
        self.view.addSubview(self.testBtn!)
    }
    
    @objc fileprivate func trigger(sender:UIButton){
        print("PUSHED")
        viewModel?.pushBtn()
        sleep(3)
        //viewViewModel?.anotherPush("Am a Dog!")
    }
    
    fileprivate func changeLabelValue(){
        guard let viewModel = viewModel else {
            return
        }
        viewModel.label.fire { [unowned self] in
            self.testLabel?.text = $0
        }
    }
    
    fileprivate func changeLabelContent(){
        guard let viewModel = viewViewModel else {
            return
        }
        viewModel.hello.fire { [unowned self] in
            self.testLabel?.text = $0
        }

    }
}
