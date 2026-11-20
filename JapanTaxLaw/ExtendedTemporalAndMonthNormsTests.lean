import JapanTaxLaw.ExtendedTemporalAndMonthNorms
import JapanTaxLaw.ExtendedTemporalAndMonthNormsSpec

/-!
# ExtendedTemporalAndMonthNormsTests — 上限・月数下限
-/
namespace JapanTaxLaw.ExtendedTemporalAndMonthNormsTests

open JapanTaxLaw.ExtendedTemporalAndMonthNorms

theorem window_spec (p e b : Nat) :
    inWindow p e b = true ↔ JapanTaxLaw.ExtendedTemporalAndMonthNormsSpec.windowSpec p e b := by
  simp [inWindow, JapanTaxLaw.ExtendedTemporalAndMonthNormsSpec.windowSpec]

theorem months_spec (m : Nat) :
    effectiveMonths m = JapanTaxLaw.ExtendedTemporalAndMonthNormsSpec.monthsSpec m := by rfl

example : inWindow 100 101 12 = true := by decide
example : inWindow 100 100 12 = false := by decide
example : inWindow 100 112 12 = true := by decide
example : inWindow 100 113 12 = false := by decide
example : effectiveMonths 0 = 1 := by decide
example : effectiveMonths 5 = 5 := by decide
example (p e b : Nat) (h : inWindow p e b = true) : p < e := window_lower p e b h
example (p e b : Nat) (h : inWindow p e b = true) : e <= p + b := window_upper p e b h
example (p e b : Nat) (h1 : p < e) (h2 : e <= p + b) : inWindow p e b = true :=
  window_of_bounds p e b h1 h2
example (p e b b' : Nat) (h : b <= b') (hw : inWindow p e b = true) : inWindow p e b' = true :=
  window_mono_bound p e b b' h hw
example (m : Nat) : 1 <= effectiveMonths m := months_at_least_one m
example (m : Nat) : effectiveMonths (effectiveMonths m) = effectiveMonths m := months_idempotent m
example (p e b : Nat) : Exceed.window p e b = Koenai.window p e b := wording_families_identical p e b

end JapanTaxLaw.ExtendedTemporalAndMonthNormsTests
