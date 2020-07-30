
import UIKit

class MainHeaderSectionView: UIView {
    
    //MARK: - Properties
    private var type: MainSections?
    
    private lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLbl, buyLbl, sellLbl])
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Global.boldFont(size: 24.width)
        return label
    }()
    
    private lazy var buyLbl: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Global.boldFont(size: 16.width)
        label.text = "Покупка"
        label.textAlignment = .right
        label.widthAnchor.constraint(equalToConstant: 80.width).isActive = true
        return label
    }()
    
    private lazy var sellLbl: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Global.boldFont(size: 16.width)
        label.text = "Продажа"
        label.textAlignment = .right
        label.widthAnchor.constraint(equalToConstant: 80.width).isActive = true
        return label
    }()
    
    
    //MARK: - Init
    convenience init(type: MainSections) {
        self.init()
        self.type = type
        self.titleLbl.text = type.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainHeaderSectionView {
    
    //MARK: - Set up
    private func setUp() {
        self.addSubview(labelStack)
        labelStack.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(16.width)
            make.top.bottom.equalToSuperview().inset(8.width)
        }
    }
    
    //MARK: - Configuration
    public func configure(item: CurrencyResponse?) {
        guard let item = item else { return }
        titleLbl.font  = Global.boldFont(size: 16.width)
        titleLbl.text  = "\(item.valcodebas) -> \(item.valcode)"
        buyLbl.text    = "\(item.priceBuy ?? 0)"
        sellLbl.text   = "\(item.priceSell ?? 0)"
    }
}
