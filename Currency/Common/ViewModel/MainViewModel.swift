
import Foundation
import UIKit

class MainViewModel {
    
    //MARK: - Properties
    private let dispatchGroup   : DispatchGroup = DispatchGroup()
    private var valuts          : [[CurrencyResponse]] = [[], [], []]
    private var clientWorker    : MainWorker!
    
    //MARK: - Init
    init(clientWorker: MainWorker) {
        self.clientWorker = clientWorker
    }
}

extension MainViewModel {
    
    //MARK: - Data source
    func getDataSource(didSelectItemHandler: @escaping MainDataSource.MainSelectHandler) -> MainDataSource {
        Alert.shared.getRoot()?.startActivityIndicator()
        return MainDataSource(with: self, didSelectItemHandler: didSelectItemHandler)
    }
    
    func numberOfSection() -> Int {
        return MainSections.caseCount
    }
    
    func numberOfItems(section: Int) -> Int {
        return valuts[section].count
    }
    
    func headerSection(section: Int) -> MainHeaderSectionView {
        let type = MainSections(rawValue: section)!
        return type.sectionHeader
    }
    
    func item(index: Int, section: Int) -> CurrencyResponse? {
        return valuts[section][index]
    }
    
    public func isLoaded() -> Bool {
        return (self.valuts.count == 1) ? false : true
    }
    
    //MARK: - Fetch
    public func getData(completion: @escaping () -> Void) {
    
        self.getAtfbankCurrency {
            print("getAtfbankCurrency")
        }
        
        self.getAltynCurrency {
            print("getAltynCurrency")
        }
        
        self.getHalkCurrency {
            print("getHalkCurrency")
        }
        
        self.dispatchGroup.notify(queue: .main) {
            print(self.valuts)
            Alert.shared.getRoot()?.stopActivityIndicator()
            completion()
        }
        
    }
}

//MARK: - Fetch Func
private extension MainViewModel {
    func getAltynCurrency(completion: @escaping () -> Void){
        self.dispatchGroup.enter()
        clientWorker.altynCurrency(endPoint: MainEndPoint.altynCurrency) { (result) in
            switch result {
            case .success(let data):
                self.valuts[1] = data
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.dispatchGroup.leave()
        }
    }
    
    func getAtfbankCurrency(completion: @escaping () -> Void){
        self.dispatchGroup.enter()
        clientWorker.atfbankCurrency(endPoint: MainEndPoint.atfbankCurrency) { (result) in
            switch result {
            case .success(let data):
                self.valuts[0] = data.data
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.dispatchGroup.leave()
        }
    }
    
    func getHalkCurrency(completion: @escaping () -> Void){
        self.dispatchGroup.enter()
        clientWorker.halkCurrency(endPoint: MainEndPoint.halkCurrency) { (result) in
            switch result {
            case .success(let data):
                switch data.data.currencyHistory {
                case .dict(let dict):
                    self.valuts[2] = dict["1"]?.privatePersons.map({ HalykbankCurrencyModelResponse(priceSell: $0.value.sell, priceBuy: $0.value.buy, valcode: String($0.key.prefix(3)), valcodebas: String($0.key.suffix(3))) }) ?? []
                case .array(let array):
                    self.valuts[2] = array[0].privatePersons.map({ HalykbankCurrencyModelResponse(priceSell: $0.value.sell, priceBuy: $0.value.buy, valcode: String($0.key.prefix(3)), valcodebas: String($0.key.suffix(3))) }) 
                }
                
                
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.dispatchGroup.leave()
        }
    }
}
