import UIKit

final class GradientShadowedView: UIView {
    private let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    var gradientColors: [UIColor] = [] {
        didSet {
            gradientLayer.colors = gradientColors.map({ $0.cgColor })
        }
    }
    
    var gradientLayerCornerRadius: CGFloat {
        get {
            gradientLayer.cornerRadius
        } set {
            gradientLayer.cornerRadius = newValue
        }
    }
    
    var startPoint: CGPoint = CGPoint.zero {
        didSet {
            gradientLayer.startPoint = startPoint
        }
    }
    
    var endPoint: CGPoint = CGPoint.zero {
        didSet {
            gradientLayer.endPoint = endPoint
        }
    }
    
    var shadowColor: CGColor = .init(gray: 0, alpha: 0) {
        didSet {
            self.layer.shadowColor = shadowColor
        }
    }
    
    var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    var shadowOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setGradientLayerFrame()
    }
}

extension GradientShadowedView {
    private func setupView() {
        self.layer.masksToBounds = false
        
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        gradientLayer.masksToBounds = false
        
        self.layer.addSublayer(gradientLayer)
    }
    
    private func setGradientLayerFrame() {
        gradientLayer.frame = self.bounds
    }
    
    func startColorsAnimation() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientColors.map({ $0.cgColor })
        animation.toValue = gradientColors.reversed().map({ $0.cgColor })
        animation.duration = 2.0
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(
            animation,
            forKey: nil
        )
    }
}
