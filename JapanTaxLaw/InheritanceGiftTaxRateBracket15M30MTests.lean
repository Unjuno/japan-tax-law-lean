import JapanTaxLaw.InheritanceGiftTaxRateBracket15M30MSpec

/-
# InheritanceGiftTaxRateBracket15M30MTests — kernel-checked checks for 相続税法 第二十一条の七(1)

Pinned: law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
All checks are kernel-decided (`rfl` / `by decide`) or the universal spec bridge.
Boundary categories: zero, below, at_lower, just_above, interior, at_upper,
above_upper. Finite smoke suite; universality is established by the spec bridge.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 15_000_000 := rfl
example : upperInclusiveYen = 30_000_000 := rfl

-- boundary categories (unfold so the Nat inequalities become decidable)
example : ¬ inBracket 0 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 14_999_999 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 15_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 15_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 20_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 30_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 30_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

-- impl / independent-spec agreement at the statutory boundaries
example : inBracket 15_000_000 ↔ specInBracket 15_000_000 := agree_in_bracket 15_000_000
example : inBracket 15_000_001 ↔ specInBracket 15_000_001 := agree_in_bracket 15_000_001
example : inBracket 30_000_000 ↔ specInBracket 30_000_000 := agree_in_bracket 30_000_000
example : inBracket 30_000_001 ↔ specInBracket 30_000_001 := agree_in_bracket 30_000_001

-- kernel-decided Bool boundary judgements of the modelled interval
example : inBracketBool 0 = false := by decide
example : inBracketBool 1 = false := by decide
example : inBracketBool 14_999_999 = false := by decide
example : inBracketBool 15_000_000 = false := by decide
example : inBracketBool 15_000_001 = true := by decide
example : inBracketBool 30_000_000 = true := by decide
example : inBracketBool 30_000_001 = false := by decide

-- universal agreement (kernel-checked theorem, not a finite sample)
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M
