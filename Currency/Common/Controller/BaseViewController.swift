
import UIKit
import XLPagerTabStrip

class BaseViewController: TwitterPagerTabStripViewController {
    
    // MARK: - Properties
    var isReload = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        setupTeambrellaTabLayout()
        super.viewDidLoad()
    }
    
    // MARK: - TwitterPagerTabStripViewController methods
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let altynCurrencyViewModel    = MainViewModel(sectionType: .altynCurrency)
        let atfbankCurrencyViewModel  = MainViewModel(sectionType: .atfbankCurrency)
        let halkCurrencyViewModel     = MainViewModel(sectionType: .halkCurrency)
        
        let altynCurrency             = MainViewController(viewModel: altynCurrencyViewModel)
        let atfbankCurrency           = MainViewController(viewModel: atfbankCurrencyViewModel)
        let halkCurrency              = MainViewController(viewModel: halkCurrencyViewModel)
        
        guard isReload else {
            return [altynCurrency, atfbankCurrency, halkCurrency]
        }
        
        var childViewControllers = [altynCurrency, atfbankCurrency, halkCurrency]
        
        for index in childViewControllers.indices {
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index {
                childViewControllers.swapAt(index, n)
            }
        }
        let nItems = 1 + (arc4random() % 8)
        return Array(childViewControllers.prefix(Int(nItems)))
    }
}

