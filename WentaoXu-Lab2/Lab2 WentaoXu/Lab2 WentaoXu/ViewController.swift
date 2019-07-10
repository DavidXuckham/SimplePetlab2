//
//  ViewController.swift
//  Lab2 WentaoXu
//
//  Created by labuser on 9/21/18.
//  Copyright © 2018 WentaoXu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var currentPet:petting!{
        didSet{
            updateDisplay()
        }
    }
    let colordog = UIColor.red
    let colorcat = UIColor.orange
    let colorbunny = UIColor.purple
    let colorbird = UIColor.green
    let colorfish = UIColor.cyan
    let mypets:[petting] = [petting(name:"dog",kind:.dog),
        petting(name:"cat",kind:.cat),
        petting(name:"bunny",kind:.bunny),
        petting(name:"bird",kind:.bird),
        petting(name:"fish",kind:.fish)]
    @IBOutlet weak var backGround: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBAction func dog(_ sender: UIButton) {
        image.image=UIImage(named:"dog")
        backGround.backgroundColor=colordog
        happyview.color=colordog
        foodview.color=colordog
        currentPet = mypets[0]
    }
    @IBAction func cat(_ sender: UIButton) {
     image.image=UIImage(named:"cat")
      backGround.backgroundColor=colorcat
        happyview.color=colorcat
        foodview.color=colorcat
        currentPet = mypets[1]
    }
    @IBAction func bunny(_ sender: UIButton) {
    image.image=UIImage(named:"bunny")
      backGround.backgroundColor=colorbunny
        happyview.color=colorbunny
        foodview.color=colorbunny
       currentPet = mypets[2]
    }
    @IBAction func bird(_ sender: UIButton) {
         image.image=UIImage(named:"bird")
      backGround.backgroundColor=colorbird
        happyview.color=colorbird
        foodview.color=colorbird
       currentPet = mypets[3]
    }
    @IBAction func fish(_ sender: UIButton) {
        image.image=UIImage(named:"fish")
        backGround.backgroundColor=colorfish
        happyview.color=colorfish
        foodview.color=colorfish
        currentPet = mypets[4]
    }
    @IBAction func play(_ sender: UIButton) {
        currentPet.play(ViewController: self)
        updateDisplay()
    }
    @IBAction func feed(_ sender: UIButton) {
        currentPet.feed(ViewController: self)
        updateDisplay()
    }
    func updateDisplay(){
    let happyviewvalue = Double(currentPet.happiness)/10
    let foodlvlviewvalue = Double(currentPet.food)/10
        happiness.text = "Played:\(currentPet.happiness)"
        foodlevel.text = "Fed: \(currentPet.food)"
    happyview.animateValue(to: CGFloat(happyviewvalue))
    foodview.animateValue(to: CGFloat(foodlvlviewvalue))
    }
    @IBOutlet weak var happiness: UILabel!
    @IBOutlet weak var foodlevel: UILabel!
    @IBOutlet weak var happyview: DisplayView!
    @IBOutlet weak var foodview: DisplayView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
          popUpNoti(title: "To start", message: "Please choose a pet")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }       
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
           currentPet.reset()
            updateDisplay()
            popUpNoti(title: "A new day starts!", message: "Go having fun with your adorable pets!")
        }
    }
    func popUpNoti (title:String, message:String){
        let notification = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        notification.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{(action)in notification.dismiss(animated: true, completion: nil)}))
        self.present(notification,animated: true,completion: nil)
    }

}

