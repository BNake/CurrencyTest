
import XLPagerTabStrip
import UIKit

class MainViewModel {
    
    //MARK: - Properties
    private var valuts        : [CurrencyResponse] = []
    private var clientWorker  : MainWorker = MainWorker()
    private var sectionType   : MainSections!
    
    //MARK: - Init
    init(sectionType: MainSections) {
        self.sectionType  = sectionType
    }
}

extension MainViewModel {
    
    //MARK: - Data source
    func getDataSource() -> MainDataSource {
        Alert.shared.getRoot()?.startActivityIndicator()
        return MainDataSource(with: self)
    }
    
    func itemSectionInfo() -> IndicatorInfo {
        return sectionType.title
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfItems(section: Int) -> Int {
        return valuts.count
    }
    
    func headerSection(section: Int) -> MainHeaderSectionView {
        let type = MainSections(rawValue: section)!
        return type.sectionHeader
    }
    
    func item(index: Int) -> CurrencyResponse? {
        return valuts[index]
    }
    
    public func isLoaded() -> Bool {
        return (self.valuts.count == 1) ? false : true
    }
    
    //MARK: - Fetch
    public func getSectionData(completion: @escaping () -> Void) {

        switch sectionType{
        case .altynCurrency:
            self.getAltynCurrency {
                print("getAltynCurrency")
                completion()
            }
        case .atfbankCurrency:
            self.getAtfbankCurrency {
                print("getAtfbankCurrency")
                completion()
            }
        case .halkCurrency:
            self.getHalkCurrency {
                print("getHalkCurrency")
                completion()
            }
        default:
            break
        }
        
    }
}

//MARK: - Fetch Func
private extension MainViewModel {
    func getAltynCurrency(completion: @escaping () -> Void){
        clientWorker.altynCurrency(endPoint: MainEndPoint.altynCurrency) { (result) in
            Alert.shared.getRoot()?.stopActivityIndicator()
            switch result {
            case .success(let data):
                self.valuts = data
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAtfbankCurrency(completion: @escaping () -> Void){
        clientWorker.atfbankCurrency(endPoint: MainEndPoint.atfbankCurrency) { (result) in
            Alert.shared.getRoot()?.stopActivityIndicator()
            switch result {
            case .success(let data):
                self.valuts = data.data
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getHalkCurrency(completion: @escaping () -> Void){
        clientWorker.halkCurrency(endPoint: MainEndPoint.halkCurrency) { (result) in
            switch result {
            case .success(let data):
                switch data.data.currencyHistory {
                case .dict(let dict):
                    self.valuts = dict["1"]?.privatePersons.map({ HalykbankCurrencyModelResponse(priceSell: $0.value.sell, priceBuy: $0.value.buy, valcode: String($0.key.prefix(3)), valcodebas: String($0.key.suffix(3))) }) ?? []
                case .array(let array):
                    self.valuts = array[0].privatePersons.map({ HalykbankCurrencyModelResponse(priceSell: $0.value.sell, priceBuy: $0.value.buy, valcode: String($0.key.prefix(3)), valcodebas: String($0.key.suffix(3))) })
                }
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
