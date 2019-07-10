//
//  petting.swift
//  Lab2 WentaoXu
//
//  Created by labuser on 9/22/18.
//  Copyright © 2018 WentaoXu. All rights reserved.
//

import Foundation
import UIKit
class petting{
    private (set) var happiness:Int = 0
    private (set) var food: Int = 0
    enum PetKind {
        case dog
        case cat
        case bunny
        case bird
        case fish
    }
    var name:String?
    var kind:PetKind
    func play(ViewController:ViewController)  {
        if(food > 0){
        happiness += 1
            food -= 1}
        if(happiness>10)
        {happiness = 10}
        if(food == 0){
           ViewController.popUpNoti(title: "Reminder", message: "Please fed me before having fun. :(")
        }
        if(food<0){
            food=0
        }
    }
    
    func feed(ViewController:ViewController){
        food += 1
        if(food>=10){
            ViewController.popUpNoti(title: "Reminder", message: "I am full let's have fun!")
            food = 10
        }
        if(food<0){
            food = 0
        }
    }
    func reset(){
        food = 0
        happiness = 0
    }
    init(name:String,kind:PetKind){
        self.name = name
        self.kind = kind
       
    }
    
}
