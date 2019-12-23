//
//  Presenter.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol View:AnyObject {
    func setCities(with object:[CitiesModel]) -> Void
    func setInfo(with object:[InfoModel]) -> Void
}

final class Presenter: NSObject {
    
    private weak var view:View?
    
    public init(view:View) {
        self.view = view
    }
    
    public func getCities() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard self != nil else { return }
            
            let array = self?.setCities()
            
            DispatchQueue.main.async {
                self?.view?.setCities(with: array ?? Array<CitiesModel>())
            }
        }
    }
    
    private func setCities() -> Array<CitiesModel> {
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
        
        var array = Array<CitiesModel>()
        
        array = [athen, helsinki, montreal, espoo, newyork, milan,
                 la, tehran, london, vancouver, rome, manchester,
                 lisbon, texas, denver, torin, berlin]
        return array
    }
    
    public func getInfo() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard self != nil else { return }
            
            let array = self?.setInfos()
            
            DispatchQueue.main.async {
                self?.view?.setInfo(with: array ?? Array<InfoModel>())
            }
        }
    }
    
    private func setInfos() -> Array<InfoModel> {
        
        let ny = InfoModel.init(desc: Strings.nyDesc.rawValue,
                                population: Strings.nyPopulation.rawValue,
                                lang: Strings.nyLang.rawValue, image: #imageLiteral(resourceName: "ny"))
        
        let montreal = InfoModel.init(desc: Strings.montreal.rawValue,
                                      population: Strings.montrealPopulation.rawValue,
                                      lang: Strings.montrealLang.rawValue, image: #imageLiteral(resourceName: "montreal"))
        
        let milan = InfoModel.init(desc: Strings.milanDesc.rawValue,
                                   population: Strings.milanPopulation.rawValue,
                                   lang: Strings.milanLang.rawValue, image: #imageLiteral(resourceName: "milan"))
        
        let array = [ny, montreal, milan]
        return array
    }
}
