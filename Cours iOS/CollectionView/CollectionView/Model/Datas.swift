//
//  Datas.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class Datas {
    
    var icons: [Icon] = [
        Icon("paperplane"),
        Icon("tortoise"),
        Icon("hare"),
        Icon("book"),
        Icon("house"),
        Icon("cloud.rain"),
        Icon("play"),
        Icon("stop"),
        Icon("mic")
    ]
    
    var nature = IconSection(name: "Nature", icons: [
        Icon("flame"),
        Icon("bolt"),
        Icon("tortoise"),
        Icon("hare"),
        Icon("ant")
    ])
    
    var media = IconSection(name: "Media", icons: [
           Icon("play"),
           Icon("pause"),
           Icon("stop"),
           Icon("playpause")
       ])
    
    var weather = IconSection(name: "Weather", icons: [
        Icon("sun.min"),
        Icon("cloud.rain"),
        Icon("snow"),
        Icon("tornado"),
        Icon("wind")
    ])
    
    var sections: [IconSection] {
        return [nature, media, weather]
    }
    
}
