import UIKit
import SnapKit


class CustomTableViewCell: UITableViewCell {
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
        imageView.layer.cornerRadius = 7
        imageView.tintColor = .white
        imageView.contentMode = .center
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - Setup functions
    private func setupViews(){
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
    }

    private func setupConstraints(){
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(16)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
    }

    //MARK: - Filling container function
    public func configure(image: UIImage?, title: String, color: UIColor) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        iconImageView.addSubview(imageView)
        titleLabel.text = title
        switch title {
        case "Airplane mode":
            iconImageView.backgroundColor = .systemYellow
        case "Cellular":
            iconImageView.backgroundColor = .systemGreen
        case "Personal Hotstop":
            iconImageView.backgroundColor = .systemGreen
        case "Notifications":
            iconImageView.backgroundColor = .systemRed
        case "Sounds & Haptics":
            iconImageView.backgroundColor = .systemRed
        case "Focus":
            iconImageView.backgroundColor = .systemPurple
        case "Screen Time":
            iconImageView.backgroundColor = .systemPurple
        case "General":
            iconImageView.backgroundColor = .systemGray
        case "Control Center":
            iconImageView.backgroundColor = .systemGray
        case "Emergency SOS":
            iconImageView.backgroundColor = .systemRed
        default:
            iconImageView.backgroundColor = .systemBlue
        }
    }
}

