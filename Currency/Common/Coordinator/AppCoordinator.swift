
import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    var rootViewController: UINavigationController!
    var window            : UIWindow?
    
    //MARK: - Init
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        guard let window          = self.window else { return }
        window.backgroundColor    = Global.backgroundColor()
        let baseViewcontroller    = BaseViewController()
        self.rootViewController   = UINavigationController(rootViewController: baseViewcontroller)
        window.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
    }
    
}
