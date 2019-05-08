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
        
        let montreal = CitiesModel(name:"Montreal")
        let newyork = CitiesModel(name:"New York")
        let milan = CitiesModel(name:"Milan")
        let la = CitiesModel(name:"Los Angles")
        let tehran = CitiesModel(name:"Tehran")
        let london = CitiesModel(name: "London")
        let vancouver = CitiesModel(name: "Vancouver")
        
        array.append(montreal)
        array.append(newyork)
        array.append(milan)
        array.append(la)
        array.append(tehran)
        array.append(london)
        array.append(vancouver)
        
        view?.setCities(with: array)
    }
    
    public func getInfo() {
        
        var array = Array<InfoModel>()
        
        let ny = InfoModel.init(desc: "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers.", population: "8.623 million", lang: "English", image: #imageLiteral(resourceName: "ny"))
        
        let montreal = InfoModel.init(desc: "Montréal is the largest city in Canada's Québec province. It’s set on an island in the Saint Lawrence River and named after Mt. Royal, the triple-peaked hill at its heart", population: "1.78 million", lang: "English/French", image: #imageLiteral(resourceName: "montreal"))
        
        let milan = InfoModel.init(desc: "Milan, a metropolis in Italy's northern Lombardy region, is a global capital of fashion and design. Home to the national stock exchange, it’s a financial hub also known for its high-end restaurants and shops.", population: "1.352 million", lang: "Itilian", image: #imageLiteral(resourceName: "milan"))
        
        array.append(ny)
        array.append(montreal)
        array.append(milan)
        
        view?.setInfo(with: array)
    }
}
