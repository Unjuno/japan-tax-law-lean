import JapanTaxLaw.PerItemEnforcementDates
import JapanTaxLaw.PerItemEnforcementDatesSpec

/-!
# PerItemEnforcementDatesTests — 各号の境界・仕様一致
-/
namespace JapanTaxLaw.PerItemEnforcementDatesTests

open JapanTaxLaw.PerItemEnforcementDates

def dates : Nat → Nat := fun n => 100 + n

theorem listed_spec (i c : Nat) :
    (i < c) ↔ JapanTaxLaw.PerItemEnforcementDatesSpec.listedSpec i c := by rfl

theorem effective_spec (i c f : Nat) :
    perItemEffective i c dates f =
      JapanTaxLaw.PerItemEnforcementDatesSpec.effectiveSpec i c dates f := by rfl

example : perItemEffective 0 3 dates 999 = 100 := by decide
example : perItemEffective 2 3 dates 999 = 102 := by decide
example : perItemEffective 3 3 dates 999 = 999 := by decide
example (i c f : Nat) (h : i < c) : perItemEffective i c dates f = dates i :=
  listed_item_uses_own_date i c dates f h
example (i c f : Nat) (h : c <= i) : perItemEffective i c dates f = f :=
  unlisted_item_uses_fallback i c dates f h
example (i c : Nat) : ¬ (i < c ∧ c <= i) := listed_unlisted_exclusive i c
example (i c : Nat) : i < c ∨ c <= i := listed_unlisted_exhaustive i c
example (i c f : Nat) : V1.effective i c dates f = V2.effective i c dates f :=
  spelling_variants_identical i c dates f

end JapanTaxLaw.PerItemEnforcementDatesTests
