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
    private var citiesDictionary = [String: Array<String>]()
    private var citySectionTitles = Array<String>()

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
    @IBOutlet weak private var infoTableLeadingConstraint: NSLayoutConstraint!
    
    @IBAction private func onClickCitiesBarButtonItem(_ sender: UIBarButtonItem) {
        
        CitiesTableAnimation(parentView: view,
                             leadingConstraint: infoTableLeadingConstraint).animate()
    }
    private func generateCitiesDict() {
        for city in cities {
            let cityKey = String(city.name.prefix(1))
            if var cityValues = citiesDictionary[cityKey] {
                cityValues.append(city.name)
                citiesDictionary[cityKey] = cityValues
            } else {
                citiesDictionary[cityKey] = [city.name]
            }
        }
        
        citySectionTitles = [String](citiesDictionary.keys)
        citySectionTitles = citySectionTitles.sorted(by: { $0 < $1 })
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
            return citySectionTitles.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == citiesTableView {
            let label = UILabel()
//                 rgb(30, 144, 255)
            label.font = UIFont(name: "AvenirNext-Bold ", size: 14)
            label.textColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
            label.textAlignment = .left
            label.backgroundColor = .clear
            label.text = citySectionTitles[section]
            return label
        } else {
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == citiesTableView {
            
            let cityKey = citySectionTitles[section]
            if let cityValues = citiesDictionary[cityKey] {
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
            
            let cityKey = citySectionTitles[indexPath.section]
            if let cityValues = citiesDictionary[cityKey] {
                cell.fill(cell: cityValues[indexPath.row])
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
            return citySectionTitles
        } else {
            return nil
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
        generateCitiesDict()
        citiesTableView.reloadData()
    }
    
    func setInfo(with object: [InfoModel]) {
        infoes = object
        infoTableView.reloadData()
    }
}

