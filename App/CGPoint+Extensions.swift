import CoreGraphics

extension CGPoint {
    func `in`(bounds: CGRect) -> Bool {
        bounds.contains(self)
    }
}
