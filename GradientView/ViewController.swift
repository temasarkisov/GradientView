import UIKit

class ViewController: UIViewController {
    private let gradientShadowedView: GradientShadowedView = GradientShadowedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gradientShadowedView.startColorsAnimation()
    }
}

extension ViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        setupGradientShadowedView()
    }
    
    private func setupGradientShadowedView() {
        gradientShadowedView.gradientColors = [
            UIColor.orange,
            UIColor.blue
        ]
        gradientShadowedView.gradientLayerCornerRadius = 20
        gradientShadowedView.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientShadowedView.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientShadowedView.shadowColor = UIColor.blue.cgColor
        gradientShadowedView.shadowOffset = CGSize(width: 10, height: 10)
        gradientShadowedView.shadowOpacity = 1
        gradientShadowedView.shadowRadius = 20
        
        gradientShadowedView.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(gradientShadowedView)
        
        NSLayoutConstraint.activate([
            gradientShadowedView.heightAnchor.constraint(
                equalToConstant: 100
            ),
            gradientShadowedView.widthAnchor.constraint(
                equalToConstant: 100
            ),
            gradientShadowedView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 100
            ),
            gradientShadowedView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
        ])
    }
}
