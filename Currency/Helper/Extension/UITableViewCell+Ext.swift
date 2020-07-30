
import UIKit

extension UITableViewCell {

    var tableView: UITableView? {
        var view = superview
        while let v = view, v.isKind(of: UITableView.self) == false {
            view = v.superview
        }
        return view as? UITableView
    }
    
    static func cellIdentifier() -> String {
        return String.init(describing: self)
    }
}

extension UICollectionViewCell {

    static func cellIdentifier() -> String {

        return String.init(describing: self)
    }
}
