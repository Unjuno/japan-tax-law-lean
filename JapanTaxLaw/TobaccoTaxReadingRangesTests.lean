import JapanTaxLaw.TobaccoTaxReadingRanges
import JapanTaxLaw.TobaccoTaxReadingRangesSpec

/-!
# TobaccoTaxReadingRangesTests — 区間境界・包含・重複
-/
namespace JapanTaxLaw.TobaccoTaxReadingRangesTests

open JapanTaxLaw.TobaccoTaxReadingRanges

theorem pref_spec (p : Nat) :
    Pref.applies p = true ↔ JapanTaxLaw.TobaccoTaxReadingRangesSpec.prefRangeSpec p := by
  simp [Pref.applies, inRange, JapanTaxLaw.TobaccoTaxReadingRangesSpec.prefRangeSpec]

theorem art52_spec (p : Nat) :
    Art52.applies p = true ↔ JapanTaxLaw.TobaccoTaxReadingRangesSpec.art52RangeSpec p := by
  simp [Art52.applies, inRange, JapanTaxLaw.TobaccoTaxReadingRangesSpec.art52RangeSpec]

example : Pref.applies 4 = true := by decide
example : Pref.applies 8 = true := by decide
example : Pref.applies 9 = false := by decide
example : City.applies 6 = true := by decide
example : Art52.applies 7 = true := by decide
example : Art52.applies 8 = false := by decide
example : Art51.applies 8 = true := by decide

example (lo hi p : Nat) : inRange lo hi p = true ↔ lo <= p ∧ p <= hi := range_iff lo hi p
example (p : Nat) : Pref.applies p = City.applies p := pref_eq_city p
example (p : Nat) (h : Art52.applies p = true) : Art51.applies p = true := art52_subset_art51 p h
example (p : Nat) :
    (Pref.applies p = true ∧ Art52.applies p = true) ↔ inRange 4 7 p = true :=
  overlap_pref_art52 p

end JapanTaxLaw.TobaccoTaxReadingRangesTests
