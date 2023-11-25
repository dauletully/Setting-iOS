//
//  SettingView.swift
//  Setting iOS
//
//  Created by Dinmukhammed Begaly on 25.11.2023.
//

import UIKit
import SnapKit

protocol SettingViewDelegate: AnyObject {
    func settingOption(setting: SettingOptions)
}

class TableView: UIView {
    //MARK: UI elements
    private lazy var models: [[SettingOptions]] = []
    weak var delegate: SettingViewDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell_id")
        tableView.register(TableViewCellWithSwitch.self, forCellReuseIdentifier: "cellSwitch_id")
        tableView.register(TableViewCellWithText.self, forCellReuseIdentifier: "cellText_id")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    private func setupViews(){
        addSubview(tableView)
    }

    private func setupConstraints(){
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    public func configureView(setting: [[SettingOptions]]) {
        models = setting
    }

}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = models[indexPath.section][indexPath.row]

        if model.title == "Airplane mode" || model.title == "VPN" {
            let cellWithSwitch = tableView.dequeueReusableCell(withIdentifier: "cellSwitch_id", for: indexPath) as? TableViewCellWithSwitch
            cellWithSwitch?.configure(image: model.iconImage, title: model.title, color: .systemYellow)
            return cellWithSwitch ?? UITableViewCell()
        }

        if model.title == "Bluetooth" || model.title == "Wi-Fi" {
            let cellWithText = tableView.dequeueReusableCell(withIdentifier: "cellText_id", for: indexPath) as? TableViewCellWithText
            cellWithText?.configure(image: model.iconImage, title: model.title, color: .blue)
            cellWithText?.accessoryType = .disclosureIndicator
            return cellWithText ?? UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as? CustomTableViewCell
        cell?.configure(image: model.iconImage, title: model.title, color: .blue)
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section][indexPath.row]

        if indexPath != [0, 0] {
            delegate?.settingOption(setting: model)
        }
        print("Pressed cell: \(model.title)")
    }
}
