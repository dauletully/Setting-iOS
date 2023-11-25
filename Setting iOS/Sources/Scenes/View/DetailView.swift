import UIKit

class DetailView: UIView {
    
    //MARK: - UI element
    var model = String()

    private lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configureTitle(text: String?) {
        self.TitleLabel.text = text
    }
    private func setupViews() {
        addSubview(TitleLabel)
        backgroundColor = .systemBackground
    }

    private func setupConstraints() {
        TitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
        }
    }
}
