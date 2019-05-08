//
//  ViewController.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private var cities = Array<CitiesModel>()
    private var infoes = Array<InfoModel>()
    private var citiesSection = Array<String>()
    private var citiesDict = [String:Array<String>]()

    private lazy var presenter:Presenter = {
        let temp = Presenter(view: self)
        return temp
    }()
    
    @IBOutlet private weak var citiesTableView:UITableView! {
        didSet {
            citiesTableView.delegate = self
            citiesTableView.dataSource = self
            citiesTableView.register(UINib(nibName: "CitiesTVC", bundle: nil), forCellReuseIdentifier: "CitiesTVC")
        }
    }
    @IBOutlet private weak var infoTableView:UITableView! {
        didSet {
            infoTableView.delegate = self
            infoTableView.dataSource = self
            infoTableView.estimatedRowHeight = 139
            infoTableView.register(UINib(nibName: "InfoTVC", bundle: nil), forCellReuseIdentifier: "InfoTVC")
        }
    }
    
    private func generateWordsDict() {
        for city in cities {
            let key = "\(city.name[city.name.startIndex])"
            let lower = key.lowercased()
            
            if var cityValue = citiesDict[lower] {
                cityValue.append(city.name)
                citiesDict[lower] = cityValue
            } else {
                citiesDict[lower] = [city.name]
            }
        }
        citiesSection = [String](citiesDict.keys)
        citiesSection = citiesSection.sorted()
    }
}

// MARK: - Life Cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getCities()
        presenter.getInfo()
    }
}

// MARK: - TableView DataSource Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == citiesTableView {
            return citiesSection.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == citiesTableView {
            return citiesSection[section]
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == citiesTableView {
            
            let cityKey = citiesSection[section]
            if let cityValues = citiesDict[cityKey] {
                return cityValues.count
            }
            
            return 0
        } else {
            return infoes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == citiesTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTVC") as! CitiesTVC
            
            let cityKey = citiesSection[indexPath.row]
            if let _ = citiesDict[cityKey.lowercased()] {
                cell.fill(cell: cities[indexPath.row])
            }
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTVC") as! InfoTVC
            cell.fill(cell: infoes[indexPath.row])
            return cell
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if tableView == citiesTableView {
            return citiesSection
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        if tableView == citiesTableView {
            guard let index = citiesSection.index(of: title) else {
                return -1
            }
            return index
        } else {
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == citiesTableView {
            return 45
        } else {
            return UITableView.automaticDimension
        }
    }
}

// MARK: - Presenter Impelementation

extension ViewController: View {
    func setCities(with object: [CitiesModel]) {
        cities = object
        generateWordsDict()
        citiesTableView.reloadData()
    }
    
    func setInfo(with object: [InfoModel]) {
        infoes = object
        infoTableView.reloadData()
    }
}

