import UIKit
import SnapKit

class TableController: UIViewController {
    //MARK: - UI elemnts
    var settingView = TableView()
    var settingModel = SettingOptions.options
    var titleModel: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view = settingView
        setupUI()
    }
    
    private func setupUI() {
        settingView.delegate = self
        settingView.configureView(setting: settingModel)
        title = "Settings"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension TableController: SettingViewDelegate {
    func settingOption(setting: SettingOptions) {
        let vc = DetailController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

