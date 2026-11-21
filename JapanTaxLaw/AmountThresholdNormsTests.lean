import JapanTaxLaw.AmountThresholdNorms
import JapanTaxLaw.AmountThresholdNormsSpec

/-!
# AmountThresholdNormsTests — 金額閾値
-/
namespace JapanTaxLaw.AmountThresholdNormsTests

open JapanTaxLaw.AmountThresholdNorms

theorem at_most_spec (a t : Nat) :
    amountAtMost a t = true ↔ JapanTaxLaw.AmountThresholdNormsSpec.atMostSpec a t := by
  simp [amountAtMost, JapanTaxLaw.AmountThresholdNormsSpec.atMostSpec]

theorem exceeds_spec (a t : Nat) :
    amountExceeds a t = true ↔ JapanTaxLaw.AmountThresholdNormsSpec.exceedsSpec a t := by
  simp [amountExceeds, JapanTaxLaw.AmountThresholdNormsSpec.exceedsSpec]

theorem band_spec (i lo hi : Nat) :
    incomeBand i lo hi = true ↔ JapanTaxLaw.AmountThresholdNormsSpec.bandSpec i lo hi := by
  simp [incomeBand, JapanTaxLaw.AmountThresholdNormsSpec.bandSpec]

example (t : Nat) : amountAtMost t t = true := at_most_boundary t
example (a t : Nat) (h : t < a) : amountAtMost a t = false := at_most_over a t h
example (t : Nat) : amountExceeds t t = false := exceeds_boundary t
example (a t : Nat) (h : t < a) : amountExceeds a t = true := exceeds_over a t h
example (lo hi : Nat) (h : lo <= hi) : incomeBand lo lo hi = true := band_lo lo hi h
example (lo hi : Nat) (h : lo <= hi) : incomeBand hi lo hi = true := band_hi lo hi h
example (i lo hi : Nat) (h : hi < i) : incomeBand i lo hi = false := band_outside i lo hi h
example (t : Nat) : limitTimesCount t 0 = 0 := limit_zero_count t
example : amountThresholdDeclared = true := amount_threshold_is_declaration

end JapanTaxLaw.AmountThresholdNormsTests
