
import XLPagerTabStrip
import UIKit


class MainViewController: UIViewController,HasCustomView {
    
    //MARK: - Porperties
    typealias CustomView   = MainTableView
    private var viewModel  : MainViewModel!
    private var dataSource : MainDataSource?
    
    //MARK: - Lifecycle
    override func loadView() {
        let mainView = CustomView(frame: .zero, style: UITableView.Style.plain)
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        self.setUpNavigationBar()
        self.loadData()
    }
    
    //MARK: - Init
    convenience init(viewModel: MainViewModel) {
        self.init()
        self.viewModel = viewModel
    }

}

extension MainViewController {
    
    //MARK: - Load data
    private func loadData() {
        viewModel.getData { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.customView.reloadData()
            strongSelf.customView.stopRefreshing()
        }
    }
    
    //MARK: - Set up
    private func setUp() {
        dataSource               = viewModel.getDataSource(didSelectItemHandler: didSelectItem())
        customView.delegate      = dataSource
        customView.dataSource    = dataSource
        customView.pullToRefresh = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.loadData()
        }
    }
    
    private func setUpNavigationBar() {
        title = "Валюта"
    }
    
    //MARK: - Action
    private func didSelectItem() -> MainDataSource.MainSelectHandler {
        return { [weak self] in
            if let `self` = self {
                print("press")
            }
        }
    }
}

// MARK: - IndicatorInfoProvider
extension MainViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return viewModel.itemSectionInfo()
    }
    
}
