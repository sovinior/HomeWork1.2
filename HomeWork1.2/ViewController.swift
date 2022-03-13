//
//  ViewController.swift
//  HomeWork1.2
//
//  Created by Рамазан Шахбанов on 12.03.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet weak var redLight: UIView!            //объявили вьюшки
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!       //объявили кнопку
    
    private var currentLight = CurrentLight.red     //присваиваю новой var цвет красный
    private let lightIsOn: CGFloat = 1              //св-во вкл света имеет прозрачность 1
    private let lightIsOff: CGFloat = 0.3           //св-во выкл света имеет прозрачность 0.3
    //Можно было не создавать lightIsOn и lightIsOff со значениями 1 и 0.3, а могли бы при вызове alpha присваивать значение, но тогда не понятен был бы код.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    startButton.layer.cornerRadius = 10             //добавляем на кнопку слой(layer) радиус угла кнопки (.cornerRadius = 10)
    
    redLight.alpha = lightIsOff                     //выкл все цвета на светофоре. alpha - это прозрачность вьюшки
    yellowLight.alpha = lightIsOff
    greenLight.alpha = lightIsOff
    
    print("Размер стороны, доступный в методе viewDidLoad: \(redLight.frame.height)")
}

override func viewDidLayoutSubviews() {
    redLight.layer.cornerRadius = redLight.frame.width / 2          //скругляем квадраты (вьюшки) сигналов светофора
    yellowLight.layer.cornerRadius = redLight.frame.width / 2       // радиус угла вьюшки = ширине вьюшки / 2
    greenLight.layer.cornerRadius = redLight.frame.width / 2
    
    print("Размер стороны, доступный в методе viewDidLayoutSubviews: \(redLight.frame.height)")
}


//чтобы кнопка меняла текст нужно чтобы кнопка была style и state config (default)
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {            // если текущее название (currentTitle) кнопки =START,
            startButton.setTitle("NEXT", for: .normal)      // то устан. название (setTitle) на NEXT
    }
    
        switch currentLight {                               //т.к мы use перечисление (enum) нужно use switch
        case .red:                                            // если у нас красный
            greenLight.alpha = lightIsOff                     // то зелёный выкл
            redLight.alpha = lightIsOn                        // крачный вкл
            currentLight = .yellow                            // и меняем текущий цвет на жёлтый
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    }
}
