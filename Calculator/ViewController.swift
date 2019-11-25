//
//  ViewController.swift
//  Calculator
//
//  Created by Adrian Atanasov on 10/26/19.
//  Copyright © 2019 Adrian Atanasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var selected = 0
    var check = false
    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func clearB(_ sender: Any) {
        input.text?.removeAll()
        output.text?.removeAll()
        input.text = self.menu[selected].input
        output.text = self.menu[selected].output
        check = false
    }
    
    @IBAction func numbers(_ sender: UIButton){
        if(sender.tag == 1 && check == false){
        input.text? = "-" + input.text!
        check = true
        }else if(check == true){
        input.text?.removeFirst()
        check = false
        }else{
        input.text = sender.titleLabel!.text! + input.text!
        }
        input.textAlignment = .right
        let string = input.text?.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        var conv = 0.0
        conv = Calc.calculate(option: selected, string: string!, makeNeg: check)
        switch selected {
        case 0:
            output.text = String(conv) + self.menu[selected].output
        case 1:
            output.text = String(conv) + self.menu[selected].output
        case 2:
            output.text = String(conv) + self.menu[selected].output
        case 3:
            output.text = String(conv) + self.menu[selected].output
        default:
            print("Error")
        }
    }
    var menu = [conv(label: "Fahrenheit to celcius", input: "°F", output: "°C"),
                conv(label: "Celcius to Fahrenheit", input: "°C", output: "°F"),
                conv(label: "Miles to Kilometers", input: "mi", output: "km"),
                conv(label: "Kilometers to Miles", input: "km", output: "mi")]

    @IBAction func convert(_ sender: Any) {
       let sheet = UIAlertController(title: "Converter", message: "Choose a Converter", preferredStyle: UIAlertController.Style.actionSheet)
       
        sheet.addAction(UIAlertAction(title: "Fahrenheit to celcius", style: UIAlertAction.Style.default, handler: {
            (UIAlertAction) -> Void in
            self.selected = 0
            self.output.text?.removeAll()
            self.input.text?.removeAll()
            self.output.textAlignment = .right
            self.output.text?.append(self.menu[self.selected].output)
            self.input.textAlignment = .right
            self.input.text?.append(self.menu[self.selected].input)
        }))
        
        sheet.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertAction.Style.default, handler: {
            (UIAlertAction) -> Void in
            self.selected = 1
            self.output.text?.removeAll()
            self.input.text?.removeAll()
            self.output.textAlignment = .right
            self.output.text?.append(self.menu[self.selected].output)
            self.input.textAlignment = .right
            self.input.text?.append(self.menu[self.selected].input)
            
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertAction.Style.default, handler: {
            (UIAlertAction) -> Void in
            self.selected = 2
            self.output.text?.removeAll()
            self.input.text?.removeAll()
            self.output.textAlignment = .right
            self.output.text?.append(self.menu[self.selected].output)
            self.input.textAlignment = .right
            self.input.text?.append(self.menu[self.selected].input)
            
            
        }))

        sheet.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertAction.Style.default, handler: {
            (UIAlertAction) -> Void in
            self.selected = 3
            self.output.text?.removeAll()
            self.input.text?.removeAll()
            self.output.textAlignment = .right
            self.output.text?.append(self.menu[self.selected].output)
            self.input.textAlignment = .right
            self.input.text?.append(self.menu[self.selected].input)
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Cancel", style:
            UIAlertAction.Style.cancel, handler: {
            (UIAlertAction) -> Void in
                
        }))
        self.present(sheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

