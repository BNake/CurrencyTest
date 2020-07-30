
import XLPagerTabStrip

extension TwitterPagerTabStripViewController {
    func setupTeambrellaTabLayout() {
        settings.style.dotColor = UIColor(white: 1, alpha: 0.4)
        settings.style.selectedDotColor = UIColor.white
        settings.style.portraitTitleFont = UIFont.systemFont(ofSize: 18)
        settings.style.landscapeTitleFont = UIFont.systemFont(ofSize: 15)
        settings.style.titleColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
    }
}
