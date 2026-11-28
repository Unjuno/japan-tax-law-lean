import JapanTaxLaw.Reiwa8LocalGrantCoefficientScale

/-
# Reiwa8LocalGrantCoefficientScaleSpec — 令和八年度地方交付税特例省令 1(1) の独立定式

Pinned: law 508M60000008056, revision 508M60000008056_20260401_000000000000000,
Article 1 Paragraph 1; needle 「…〇・二四八九七八七六三四を乗じて得た額とする」.

Independent restatement: the deliverable is the prior-year ordinary grant
multiplied by an exact ten-decimal coefficient below one; represented as an
independent numerator/denominator pair with cross-multiplied kernel checks.
Agreement with the implementation is a separate bridge.
-/

namespace JapanTaxLaw.Reiwa8LocalGrantCoefficientScale

/-- 独立定式: 〇・二四八九七八七六三四 の分子。 -/
def specNum : Nat := 2489787634

/-- 独立定式: 分母 10^10。 -/
def specDen : Nat := 10000000000

/-- 独立定式:  numerator（impl 識別子は使わない）。 -/
def specScaledNum (prev : Nat) : Nat := prev * specNum

theorem agreeNum : coefficientNumerator = specNum := by
  unfold coefficientNumerator specNum
  rfl

theorem agreeDen : coefficientDenominator = specDen := by
  unfold coefficientDenominator specDen
  rfl

theorem agreeScaledNum (prev : Nat) : scaledNumerator prev = specScaledNum prev := by
  unfold scaledNumerator specScaledNum
  rw [agreeNum]

example : specScaledNum 0 = 0 := by decide
example : specScaledNum 10000000000 = 2489787634 * specDen := by decide
example : specNum < specDen := by decide

end JapanTaxLaw.Reiwa8LocalGrantCoefficientScale
