import JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243
import JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243Spec

/-
# LocalGasolineGuaranteeRatio44Of243Tests — 地方揮発油税法施行令 1(1) の kernel-decided 検証

Pinned: law 330CO0000000151 / revision 330CO0000000151_20241001_506CO0000000148.
Coverage: 44/243 verbatim numerals, coprimality, proper fraction, exact
cross-multiplied relations at zero/base/double, impl/spec agreement.
-/

namespace JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243

example : ratioNumerator = 44 := by decide
example : ratioDenominator = 243 := by decide
example : Nat.gcd ratioNumerator ratioDenominator = 1 := by decide
example : ratioNumerator < ratioDenominator := by decide
example : ratioDenominator * 44 = ratioNumerator * 243 := by decide
example : ratioDenominator * 0 = ratioNumerator * 0 := by decide
example : ratioDenominator * 88 = ratioNumerator * 486 := by decide

-- impl / 独立仕様の一致
example : ratioNumerator = specNum := by decide
example : ratioDenominator = specDen := by decide
example : specNum = 44 := by decide
example : specDen = 243 := by decide
example : Nat.gcd specNum specDen = 1 := by decide
example : specNum < specDen := by decide
example : specDen * 44 = specNum * 243 := by decide

end JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243
