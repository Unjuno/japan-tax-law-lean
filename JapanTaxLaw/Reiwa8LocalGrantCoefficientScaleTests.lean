import JapanTaxLaw.Reiwa8LocalGrantCoefficientScale
import JapanTaxLaw.Reiwa8LocalGrantCoefficientScaleSpec

/-
# Reiwa8LocalGrantCoefficientScaleTests — 令和八年度地方交付税特例省令 1(1) の kernel-decided 検証

Pinned: law 508M60000008056 / revision 508M60000008056_20260401_000000000000000.
Coverage: statutory numerator/denominator, zero, exact division at the
denominator, monotonicity, coefficient<1/positive, impl/spec agreement.
-/

namespace JapanTaxLaw.Reiwa8LocalGrantCoefficientScale

example : coefficientNumerator = 2489787634 := by decide
example : coefficientDenominator = 10000000000 := by decide

-- 境界
example : scaledNumerator 0 = 0 := by decide
example : scaledNumerator 10000000000 = 2489787634 * coefficientDenominator := by decide
example : scaledNumerator 1 < scaledNumerator 2 := by decide
example : coefficientNumerator < coefficientDenominator := by decide
example : 0 < coefficientNumerator := by decide

-- impl / 独立仕様の一致
example : coefficientNumerator = specNum := by decide
example : coefficientDenominator = specDen := by decide
example : scaledNumerator 0 = specScaledNum 0 := by decide
example : scaledNumerator 1 = specScaledNum 1 := by decide
example : scaledNumerator 2 = specScaledNum 2 := by decide
example : scaledNumerator 10000000000 = specScaledNum 10000000000 := by decide
example : specNum < specDen := by decide

end JapanTaxLaw.Reiwa8LocalGrantCoefficientScale
