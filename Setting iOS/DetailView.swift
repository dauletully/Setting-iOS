import UIKit

class DetailView: UIViewController {
    
    //MARK: - UI element
    var model = String()
    
    private lazy var connection: UISwitch = {
        let switcher = UISwitch()
        switcher.setOn(false, animated: true)
        return switcher
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        title = model
        view.backgroundColor = .systemBackground
        view.addSubview(connection)
    }

    private func setupConstraints() {
        connection.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
}
