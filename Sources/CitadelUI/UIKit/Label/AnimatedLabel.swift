#if os(iOS)

import UIKit

enum CountingMethod {
	case easeInOut, easeIn, easeOut, linear
}

enum AnimationDuration {
    ///1.5 seconds
    case laborious
    ///1.0 second
    case plodding
    ///0.5 seconds
    case strolling
    ///0.25 seconds
    case brisk
    ///0 seconds
    case noAnimation

    var measurementValue: TimeInterval {
        switch self {
        case .laborious: return 1.5
        case .plodding: return 1.0
        case .strolling: return 0.5
        case .brisk: return 0.25
        case .noAnimation: return 0.0
        }
    }
}

enum DecimalPoints {
	case zero, one, two, ridiculous

	var format: String {
		switch self {
		case .zero: return "%.0f"
		case .one: return "%.1f"
		case .two: return "%.2f"
		case .ridiculous: return "%f"
		}
	}
}

final class AnimatedLabel: UILabel {
	typealias OptionalCallback = (() -> Void)
	typealias OptionalFormatBlock = (() -> String)

	var completion: OptionalCallback?
	var animationDuration: AnimationDuration = .brisk
	var decimalPoints: DecimalPoints = .zero
	var countingMethod: CountingMethod = .easeInOut
	var customFormatBlock: OptionalFormatBlock?

	private var currentValue: Float {
		if progress >= totalTime { return destinationValue }
		return startingValue + (update(t: Float(progress / totalTime)) * (destinationValue - startingValue))
	}

	private var rate: Float = 0
	private var startingValue: Float = 0
	private var destinationValue: Float = 0
	private var progress: TimeInterval = 0
	private var lastUpdate: TimeInterval = 0
	private var totalTime: TimeInterval = 0
	private var easingRate: Float = 0
	private var timer: CADisplayLink?
    
    //----------------------------------------------------------------
    // MARK: - Count API
    //----------------------------------------------------------------
	func count(from: Float, to: Float, duration: AnimationDuration = .strolling) {
		startingValue = from
		destinationValue = to
		timer?.invalidate()
		timer = nil

        if duration.measurementValue == 0.0 {
			setTextValue(measurementValue: to)
			completion?()
			return
		}

		easingRate = 3.0
		progress = 0.0
		totalTime = duration.measurementValue
		lastUpdate = Date.timeIntervalSinceReferenceDate
		rate = 3.0

		addDisplayLink()
	}

	func countFromCurrent(to: Float, duration: AnimationDuration = .strolling) {
		count(from: currentValue, to: to, duration: duration)
	}

	func countFromZero(to: Float, duration: AnimationDuration = .strolling) {
		count(from: 0, to: to, duration: duration)
	}

	func stop() {
		timer?.invalidate()
		timer = nil
		progress = totalTime
		completion?()
	}
    
    //----------------------------------------------------------------
    // MARK: - Private API
    //----------------------------------------------------------------

	private func addDisplayLink() {
		timer = CADisplayLink(target: self, selector: #selector(self.updateValue(timer:)))
		timer?.add(to: .main, forMode: .default)
		timer?.add(to: .main, forMode: .tracking)
	}

	private func update(t: Float) -> Float {
		var t = t

		switch countingMethod {
		case .linear:
			return t
		case .easeIn:
			return powf(t, rate)
		case .easeInOut:
			var sign: Float = 1
			if Int(rate) % 2 == 0 { sign = -1 }
			t *= 2
			return t < 1 ? 0.5 * powf(t, rate) : (sign*0.5) * (powf(t-2, rate) + sign*2)
		case .easeOut:
			return 1.0-powf((1.0-t), rate)
		}
	}

	@objc private func updateValue(timer: Timer) {
		let now: TimeInterval = Date.timeIntervalSinceReferenceDate
		progress += now - lastUpdate
		lastUpdate = now

		if progress >= totalTime {
			self.timer?.invalidate()
			self.timer = nil
			progress = totalTime
		}

		setTextValue(measurementValue: currentValue)
		if progress == totalTime { completion?() }
	}

	private func setTextValue(measurementValue: Float) {
		text = String(format: customFormatBlock?() ?? decimalPoints.format, measurementValue)
	}

}
#endif
