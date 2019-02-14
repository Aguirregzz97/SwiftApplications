//
//  ViewController.swift
//  MiniRetoAndres
//
//  Created by Alumno on 1/29/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorToGuess1: UIView!
    @IBOutlet weak var colorToGuess2: UIView!
    @IBOutlet weak var colorToGuess3: UIView!
    @IBOutlet weak var colorToGuess4: UIView!
    @IBOutlet weak var colorButton1: UIButton!
    @IBOutlet weak var colorButton2: UIButton!
    @IBOutlet weak var colorButton3: UIButton!
    @IBOutlet weak var colorButton4: UIButton!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var squareResult1: UIView!
    @IBOutlet weak var squareResult2: UIView!
    @IBOutlet weak var squareResult3: UIView!
    @IBOutlet weak var squareResult4: UIView!
    @IBOutlet weak var segmentPlay: UISegmentedControl!

    let colorsStatic = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.black]
    var colors = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.black]
    var randomGeneratedColors = [UIColor]()
    var currentUIColorsButtons = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple]
    var resultSqaures = [UIView]()
    var currentColorButton = [0, 1, 2, 3]
    var numTries = 0
    
    func generateRandomNumbers() -> Void {
        for _ in 0...3 {
            let colorIndex = Int.random(in: 0...colors.count - 1)
           randomGeneratedColors.append(colors[colorIndex])
            colors.remove(at:colorIndex)
        }
    }
    
    func paintColors() -> Void {
        paintDefault()
        colorToGuess1.backgroundColor = randomGeneratedColors[0]
        colorToGuess2.backgroundColor = randomGeneratedColors[1]
        colorToGuess3.backgroundColor = randomGeneratedColors[2]
        colorToGuess4.backgroundColor = randomGeneratedColors[3]
    }
    
    func paintDefault(){
        colorButton1.backgroundColor = UIColor.red
        colorButton2.backgroundColor = UIColor.blue
        colorButton3.backgroundColor = UIColor.yellow
        colorButton4.backgroundColor = UIColor.purple
    }
    
    func hideRandomColors() -> Void {
        colorToGuess1.isHidden = segmentPlay.selectedSegmentIndex == 1 ? false : true
        colorToGuess2.isHidden = segmentPlay.selectedSegmentIndex == 1 ? false : true
        colorToGuess3.isHidden = segmentPlay.selectedSegmentIndex == 1 ? false : true
        colorToGuess4.isHidden = segmentPlay.selectedSegmentIndex == 1 ? false : true
    }
 
    @IBAction func onSegmentSwitch(_ sender: Any) {
        hideRandomColors()
    }
    
    @IBAction func colorButton1Clicked(_ sender: Any) {
        if (currentColorButton[0] == 5) {
            currentColorButton[0] = 0
        }
        else {
            currentColorButton[0] = currentColorButton[0] + 1
        }
        currentUIColorsButtons[0] = colorsStatic[currentColorButton[0]]
        colorButton1.backgroundColor = colorsStatic[currentColorButton[0]]
    }
    
    @IBAction func colorButton2Clicked(_ sender: Any) {
        if (currentColorButton[1] == 5) {
            currentColorButton[1] = 0
        }
        else {
            currentColorButton[1] = currentColorButton[1] + 1
        }
        currentUIColorsButtons[1] = colorsStatic[currentColorButton[1]]
        colorButton2.backgroundColor = colorsStatic[currentColorButton[1]]
    }
    
    @IBAction func colorButton3Clicked(_ sender: Any) {
        if (currentColorButton[2] == 5) {
            currentColorButton[2] = 0
        }
        else {
            currentColorButton[2] = currentColorButton[2] + 1
        }
        currentUIColorsButtons[2] = colorsStatic[currentColorButton[2]]
        colorButton3.backgroundColor = colorsStatic[currentColorButton[2]]
    }
    
    @IBAction func colorButton4Clicked(_ sender: Any) {
        if (currentColorButton[3] == 5) {
            currentColorButton[3] = 0
        }
        else {
            currentColorButton[3] = currentColorButton[3] + 1
        }
        currentUIColorsButtons[3] = colorsStatic[currentColorButton[3]]
        colorButton4.backgroundColor = colorsStatic[currentColorButton[3]]
    }
    
    @IBAction func reset(_ sender: Any) {
        colors = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.black]
        randomGeneratedColors.removeAll()
        currentUIColorsButtons=[UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple]
        resetResultSquares()
        numTries = 0
        counter.text = "Intento: 0"
        paintDefault()
        generateRandomNumbers()
        paintColors()
        segmentPlay.selectedSegmentIndex = 0
        hideRandomColors()
    }
    
    func resetResultSquares() -> Void {
        for i in 0...3 {
            resultSqaures[i].isHidden = true
        }
    }
    
    @IBAction func guess(_ sender: Any) {
        for i in 0...3 {
            for j in 0...3 {
                if (i == j) {
                    continue
                }
                if (currentUIColorsButtons[i] == currentUIColorsButtons[j]) {
                    let alert = UIAlertController(title: "Error", message: "No se deben de repetir colores", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alert, animated: true, completion: nil)
                    return
                }
            }
        }
        resetResultSquares()
        numTries += 1
        counter.text = "Intento: " + String(numTries)
        for i in 0...3 {
            if (currentUIColorsButtons[i] == randomGeneratedColors[i]) {
                for j in 0...3 {
                    if (resultSqaures[j].isHidden) {
                        resultSqaures[j].backgroundColor = UIColor.red
                        resultSqaures[j].isHidden = false
                        break
                    }
                }
            }
        }
        for i in 0...3 {
            for j in 0...3 {
                if(i == j) {
                    continue
                }
                if (currentUIColorsButtons[i] == randomGeneratedColors[j]) {
                    for z in 0...3 {
                        if (resultSqaures[z].isHidden) {
                            resultSqaures[z].backgroundColor = UIColor.white
                            resultSqaures[z].isHidden = false
                            break
                        }
                    }
                }
            }
        }
        var allRed = true
        for i in 0...3 {
            if (resultSqaures[i].backgroundColor == UIColor.white) {
                allRed = false
            }
        }
        if (allRed) {
            let alert = UIAlertController(title: "Felicidades", message: "Usted gano con " + String(numTries) + " intentos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            colors = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.black]
            randomGeneratedColors.removeAll()
            currentUIColorsButtons=[UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple]
            resetResultSquares()
            numTries = 0
            counter.text = "Intento: 0"
            paintDefault()
            generateRandomNumbers()
            paintColors()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultSqaures = [squareResult1, squareResult2, squareResult3, squareResult4]
        generateRandomNumbers()
        paintColors()
        
        
    }
}

