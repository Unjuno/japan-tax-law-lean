import JapanTaxLaw.LocalCorpRate93_907

/-
# LocalCorpRate93_907Spec — independent integer restatement of 九百七分の九十三

Pinned source: law 426AC0000000011, revision 426AC0000000011_20260401_507AC0000000013.
Independent restatement: 九百七分の九十三 = 93/907,
地方法人税の額 = 課税標準国際最低課税法人税額 × 93 ÷ 907 (Nat floor division).
This module owns its own `specNum`, `specDen`, `specTax`; no implementation
identifier (rateNumerator / rateDenominator / taxFor) occurs in any independent
formula. The only bridges are the kernel-checked `agreeNum`, `agreeDen`, `agreeTax`
below, each a pure `unfold ... ; rfl`.
-/

namespace JapanTaxLaw.LocalCorpRate93_907

/-- Independent 九十三 numerator = 93. -/
def specNum : Nat := 93

/-- Independent 九百七 denominator = 907. -/
def specDen : Nat := 907

/-- Independent tax formula: base * 93 / 907 (Nat floor division). -/
def specTax (base : Nat) : Nat :=
  base * specNum / specDen

/-- Bridge: statutory numerator equals independent numerator. -/
theorem agreeNum : rateNumerator = specNum := by unfold rateNumerator specNum; rfl

/-- Bridge: statutory denominator equals independent denominator. -/
theorem agreeDen : rateDenominator = specDen := by unfold rateDenominator specDen; rfl

/-- Bridge: the two formulas agree for every base (all constants occur in the body). -/
theorem agreeTax (base : Nat) : taxFor base = specTax base := by
  unfold taxFor specTax rateNumerator specNum rateDenominator specDen
  rfl

end JapanTaxLaw.LocalCorpRate93_907
