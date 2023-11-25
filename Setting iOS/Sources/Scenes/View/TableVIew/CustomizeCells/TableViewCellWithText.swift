import UIKit
import SnapKit


class TableViewCellWithText: UITableViewCell {
    //MARK: - UI elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Airplane Mode"
        return label
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .center
        return imageView
    }()

     private lazy var cellTextLabel: UILabel = {
        var label = UILabel()
        label.text = "Off"
        label.font = .systemFont(ofSize: 22)
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.layer.cornerRadius = 7
    }
    
//MARK: - Setup functions
    private func setupViews(){
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(cellTextLabel)
    }

    private func setupConstraints(){
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(16)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
        cellTextLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.trailing.equalToSuperview().offset(-15)
        }
    }

    //MARK: - Filling container function
    public func configure(image: UIImage?, title: String, color: UIColor) {
        iconImageView.image = image
        titleLabel.text = title
        iconImageView.backgroundColor = .systemBlue
        if title == "Bluetooth" {
            cellTextLabel.text = "Non connected"
        }
    }
}

