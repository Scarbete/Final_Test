import UIKit
import SnapKit



class ViewController: UIViewController {
    
    private lazy var nextButton: UIButton = {
        let view = UIButton()
        view.setTitle("Go to the next VC", for: .normal)
        view.backgroundColor = .orange
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 8
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let colorTheme = UserDefaults.standard.bool(forKey: "colorTheme")
        
        if colorTheme {
            view.window?.overrideUserInterfaceStyle = .dark
        }
        else {
            view.window?.overrideUserInterfaceStyle = .light
        }
    }

    private func initUI() {
        view.backgroundColor = .systemBackground
        setupNextButton()
    }
    
    private func setupNextButton() {
        view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(220)
        }
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    @objc func nextButtonTapped(_ sender: UIButton) {
        let vc = SecondVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
