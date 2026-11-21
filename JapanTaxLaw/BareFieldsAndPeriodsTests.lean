import JapanTaxLaw.BareFieldsAndPeriods
import JapanTaxLaw.BareFieldsAndPeriodsSpec

/-!
# BareFieldsAndPeriodsTests — 期間・レンジ・最小選択
-/
namespace JapanTaxLaw.BareFieldsAndPeriodsTests

open JapanTaxLaw.BareFieldsAndPeriods

theorem ref_spec (t : Nat) :
    resolveField t = JapanTaxLaw.BareFieldsAndPeriodsSpec.refSpec t := by rfl

theorem period_spec (d lo hi : Nat) :
    inPeriod d lo hi = true ↔ JapanTaxLaw.BareFieldsAndPeriodsSpec.periodSpec d lo hi := by
  simp [inPeriod, JapanTaxLaw.BareFieldsAndPeriodsSpec.periodSpec]

theorem range_spec (x lo hi : Nat) :
    inRange x lo hi = true ↔ JapanTaxLaw.BareFieldsAndPeriodsSpec.rangeSpec x lo hi := by
  simp [inRange, JapanTaxLaw.BareFieldsAndPeriodsSpec.rangeSpec]

theorem min_spec (a b : Nat) :
    minValue a b = JapanTaxLaw.BareFieldsAndPeriodsSpec.minSpec a b := by rfl

theorem window_spec (d b : Nat) :
    windowFrom d b = true ↔ JapanTaxLaw.BareFieldsAndPeriodsSpec.windowSpec d b := by
  simp [windowFrom, JapanTaxLaw.BareFieldsAndPeriodsSpec.windowSpec]

example (t : Nat) : resolveField t = t := resolve_field_identity t
example (lo hi : Nat) (h : lo <= hi) : inPeriod lo lo hi = true := period_at_lo lo hi h
example (lo hi : Nat) (h : lo <= hi) : inPeriod hi lo hi = true := period_at_hi lo hi h
example (d lo hi : Nat) (h : hi < d) : inPeriod d lo hi = false := period_outside d lo hi h
example (lo hi : Nat) (h : lo <= hi) : inRange lo lo hi = true := range_at_lo lo hi h
example (lo hi : Nat) (h : lo <= hi) : inRange hi lo hi = true := range_at_hi lo hi h
example (a b : Nat) (h : a <= b) : minValue a b = a := min_left a b h
example (a b : Nat) (h : b < a) : minValue a b = b := min_right a b h
example (b : Nat) : windowFrom b b = true := window_at_bound b
example (d b : Nat) (h : b < d) : windowFrom d b = false := window_over d b h
example : fieldDeclared = true := field_is_declaration

end JapanTaxLaw.BareFieldsAndPeriodsTests
