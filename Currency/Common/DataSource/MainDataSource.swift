import UIKit

class MainDataSource: NSObject {
    
    //MARK: - Properties
    weak private var viewModel  : MainViewModel?
    
    //MARK: - Init
    init(with viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
}

extension MainDataSource: UITableViewDataSource {
    
    //MARK: TableView Data source
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.viewModel,viewModel.isLoaded() else { return 0 }
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel,viewModel.isLoaded() else { return 0 }
        return viewModel.numberOfItems(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = self.viewModel else { return UITableViewCell() }
        guard let item = viewModel.item(index: indexPath.row) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.cellIdentifier(), for: indexPath) as! MainCell
        cell.configure(item: item)
        return cell
    }
    
}

extension MainDataSource: UITableViewDelegate {
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = self.viewModel else { return nil }
        return viewModel.headerSection(section: section)
    }
}
