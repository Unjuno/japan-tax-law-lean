import JapanTaxLaw.TemporalEnforcementDates
import JapanTaxLaw.TemporalEnforcementDatesSpec

/-!
# TemporalEnforcementDatesTests — 即時/遅延・境界・全称の性質
-/
namespace JapanTaxLaw.TemporalEnforcementDatesTests

open JapanTaxLaw.TemporalEnforcementDates

theorem immediate_spec (p e b : Nat) :
    enforceable 0 p e b = true ↔ JapanTaxLaw.TemporalEnforcementDatesSpec.immediateSpec p e := by
  exact immediate_iff p e b

theorem deferred_spec (mode p e b : Nat) (hm : mode ≠ 0) :
    enforceable mode p e b = true ↔ JapanTaxLaw.TemporalEnforcementDatesSpec.deferredSpec p e b := by
  exact deferred_iff mode p e b hm

example : enforceable 0 100 100 12 = true := by decide
example : enforceable 0 100 101 12 = false := by decide
example : enforceable 1 100 100 12 = false := by decide
example : enforceable 1 100 101 12 = true := by decide
example : enforceable 1 100 112 12 = true := by decide
example : enforceable 1 100 113 12 = false := by decide
example : enforceable 2 100 105 12 = true := by decide

example (p e b : Nat) : enforceable 0 p e b = true ↔ e = p := immediate_iff p e b
example (p e b : Nat) : enforceable 1 p e b = true ↔ p < e ∧ e <= p + b := deferred_iff 1 p e b (by decide)
example (mode p e b : Nat) (hm : mode ≠ 0) :
    ¬ (enforceable 0 p e b = true ∧ enforceable mode p e b = true) :=
  immediate_deferred_exclusive mode p e b hm
example (mode p e b : Nat) (hm : mode ≠ 0) (h : enforceable mode p e b = true) : p < e :=
  deferred_lower_bound mode p e b hm h
example (mode p e b : Nat) (hm : mode ≠ 0) (h : enforceable mode p e b = true) : e <= p + b :=
  deferred_upper_bound mode p e b hm h
example (p e b : Nat) : enforceable 1 p e b = enforceable 5 p e b :=
  all_deferred_variants_share_mode 1 5 p e b (by decide) (by decide)

end JapanTaxLaw.TemporalEnforcementDatesTests
