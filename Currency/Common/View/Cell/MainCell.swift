
import UIKit

class MainCell: UITableViewCell {
    
    //MARK: - Properties
    private let view = MainHeaderSectionView(frame: .zero)
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainCell {
    
    //MARK: - Configure
    func configure(item: CurrencyResponse?) {
        guard let item = item else { return }
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
        view.layer.cornerRadius = 10
        view.configure(item: item)
        
    }
    
    //MARK: - Set up
    private func setUpViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.addSubviews([view])
        
        view.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(16.width)
            make.top.bottom.equalToSuperview().inset(8.width)
        }
    }
    
}
