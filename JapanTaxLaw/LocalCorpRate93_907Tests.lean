import JapanTaxLaw.LocalCorpRate93_907Spec

/-
# LocalCorpRate93_907Tests — kernel-decided boundary / agreement checks

Pinned to law 426AC0000000011 / revision 426AC0000000011_20260401_507AC0000000013.
Rate 93/907, bases 0/1/906/907/908/1814. All examples are `by decide` on concrete
decidable propositions; no classical choice, no tactics beyond decide/rfl.
-/

namespace JapanTaxLaw.LocalCorpRate93_907

/-- zero: base 0 → 0. -/
example : taxFor 0 = 0 := by decide

/-- small_input: base 1 → 0 (floor of 93/907). -/
example : taxFor 1 = 0 := by decide

/-- threshold_below: base 906 (= 907-1) → 92. -/
example : taxFor 906 = 92 := by decide

/-- threshold_at: base 907 → 93 (exact). -/
example : taxFor 907 = 93 := by decide

/-- threshold_above: base 908 (= 907+1) → 93 (floor). -/
example : taxFor 908 = 93 := by decide

/-- exact multiple: base 1814 (= 2*907) → 186. -/
example : taxFor 1814 = 186 := by decide

/-- constant values. -/
example : rateNumerator = 93 := by decide
example : rateDenominator = 907 := by decide

/-- impl / spec agreement at the boundary bases. -/
example : taxFor 0 = specTax 0 := by decide
example : taxFor 1 = specTax 1 := by decide
example : taxFor 906 = specTax 906 := by decide
example : taxFor 907 = specTax 907 := by decide
example : taxFor 908 = specTax 908 := by decide
example : taxFor 1814 = specTax 1814 := by decide

/-- spec constants. -/
example : specNum = 93 := by decide
example : specDen = 907 := by decide

end JapanTaxLaw.LocalCorpRate93_907
