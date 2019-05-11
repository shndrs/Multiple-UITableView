//
//  Presenter.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol View:AnyObject {
    func setCities(with object:[CitiesModel])
    func setInfo(with object:[InfoModel])
}

final class Presenter: NSObject {
    
    private weak var view:View?
    
    public init(view:View) {
        self.view = view
    }
    
    public func getCities() {
        
        var array = Array<CitiesModel>()
        
        let athen = CitiesModel(name:Strings.athen.rawValue)
        let helsinki = CitiesModel(name:Strings.helsinki.rawValue)
        let montreal = CitiesModel(name:Strings.montreal.rawValue)
        let espoo = CitiesModel(name:Strings.espoo.rawValue)
        let newyork = CitiesModel(name:Strings.newyork.rawValue)
        let milan = CitiesModel(name:Strings.milan.rawValue)
        let la = CitiesModel(name:Strings.la.rawValue)
        let tehran = CitiesModel(name:Strings.tehran.rawValue)
        let london = CitiesModel(name:Strings.london.rawValue)
        let vancouver = CitiesModel(name:Strings.vancouver.rawValue)
        let rome = CitiesModel(name:Strings.rome.rawValue)
        let manchester = CitiesModel(name:Strings.manchester.rawValue)
        let lisbon = CitiesModel(name:Strings.lisbon.rawValue)
        let texas = CitiesModel(name:Strings.texas.rawValue)
        let denver = CitiesModel(name:Strings.denver.rawValue)
        let torin = CitiesModel(name:Strings.torin.rawValue)
        let berlin = CitiesModel(name:Strings.berlin.rawValue)
        
        array.append(athen)
        array.append(helsinki)
        array.append(espoo)
        array.append(montreal)
        array.append(newyork)
        array.append(milan)
        array.append(la)
        array.append(tehran)
        array.append(london)
        array.append(vancouver)
        array.append(rome)
        array.append(manchester)
        array.append(lisbon)
        array.append(texas)
        array.append(denver)
        array.append(torin)
        array.append(berlin)
        
        view?.setCities(with: array)
    }
    
    public func getInfo() {
        
        var array = Array<InfoModel>()
        
        let ny = InfoModel.init(desc: Strings.nyDesc.rawValue,
                                population: Strings.nyPopulation.rawValue,
                                lang: Strings.nyLang.rawValue, image: #imageLiteral(resourceName: "ny"))
        
        let montreal = InfoModel.init(desc: Strings.montreal.rawValue,
                                      population: Strings.montrealPopulation.rawValue,
                                      lang: Strings.montrealLang.rawValue, image: #imageLiteral(resourceName: "montreal"))
        
        let milan = InfoModel.init(desc: Strings.milanDesc.rawValue,
                                   population: Strings.milanPopulation.rawValue,
                                   lang: Strings.milanLang.rawValue, image: #imageLiteral(resourceName: "milan"))
        
        array.append(ny)
        array.append(montreal)
        array.append(milan)
        
        view?.setInfo(with: array)
    }
}
