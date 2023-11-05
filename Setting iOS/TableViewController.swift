import UIKit
import SnapKit

class TableViewController: UIViewController {

    private lazy var settings = SettingOptions.options

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell_id")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        return tableView
    }()

    var models = [SettingOptions]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        setupViews()
        setupConstraints()
    }

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as? CustomTableViewCell
        let model = settings[indexPath.section][indexPath.row]

        cell?.configure(image: model.iconImage, title: model.title, color: .blue)

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = settings[indexPath.section][indexPath.row]
        print("Pressed cell: \(model.title)")
    }
}
