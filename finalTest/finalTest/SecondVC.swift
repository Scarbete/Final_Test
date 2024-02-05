import UIKit
import SnapKit



protocol SettingCellDelegate: AnyObject {
    func didSwitchToggle(isOn: Bool)
}



class SecondVC: UIViewController {

    weak var delegate: SettingCellDelegate?
    
    @objc private lazy var toggleThemeSwitch: UISwitch = {
        let view = UISwitch()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        view.backgroundColor = .systemBackground
        setupNextButton()
    }
    
    private func setupNextButton() {
        view.addSubview(toggleThemeSwitch)
        
        let colorTheme = UserDefaults.standard.bool(forKey: "colorTheme")
        
        if colorTheme == true { toggleThemeSwitch.isOn = true }
        else { toggleThemeSwitch.isOn = false }
        
        toggleThemeSwitch.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        toggleThemeSwitch.addTarget(self, action: #selector(toggleThemeSwitch), for: .valueChanged)
    }
    
    @objc func switchButtonToggle(_ sender: UISwitch) {
        if toggleThemeSwitch.isOn == true {
            delegate?.didSwitchToggle(isOn: true)
            UserDefaults.standard.set(true, forKey: "colorTheme")
        }
        else {
            delegate?.didSwitchToggle(isOn: false)
            UserDefaults.standard.set(false, forKey: "colorTheme")
        }
    }

}


extension SecondVC: SettingCellDelegate {
    
    func didSwitchToggle(isOn: Bool) {
        if isOn {
            view.window?.overrideUserInterfaceStyle = .dark
        }
        else {
            view.window?.overrideUserInterfaceStyle = .light
        }
    }
    
}
