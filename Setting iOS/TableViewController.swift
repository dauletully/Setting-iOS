import UIKit
import SnapKit

class TableViewController: UIViewController {
    //MARK: - UI elemnts
    private lazy var settings = SettingOptions.options
    private lazy var models = [SettingOptions]()

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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        setupViews()
        setupConstraints()
    }

//MARK: - Setup functions
    private func setupViews(){
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
    }

    private func setupConstraints(){
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = settings[indexPath.section][indexPath.row]
        
        if model.title == "Airplane mode" || model.title == "VPN" {
            let cellWithSwitch = tableView.dequeueReusableCell(withIdentifier: "cellSwitch_id", for: indexPath) as? TableViewCellWithSwitch
            cellWithSwitch?.configure(image: model.iconImage, title: model.title, color: .systemYellow)
            return cellWithSwitch ?? UITableViewCell()
        } else if model.title == "Bluetooth" || model.title == "Wi-Fi" {
            let cellWithText = tableView.dequeueReusableCell(withIdentifier: "cellText_id", for: indexPath) as? TableViewCellWithText
            cellWithText?.configure(image: model.iconImage, title: model.title, color: .blue)
            cellWithText?.accessoryType = .disclosureIndicator
            return cellWithText ?? UITableViewCell()
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as? CustomTableViewCell
            cell?.configure(image: model.iconImage, title: model.title, color: .blue)
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = settings[indexPath.section][indexPath.row]
        print("Pressed cell: \(model.title)")
    }
}
