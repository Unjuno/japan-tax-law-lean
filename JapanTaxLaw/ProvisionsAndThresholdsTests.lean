import JapanTaxLaw.ProvisionsAndThresholds
import JapanTaxLaw.ProvisionsAndThresholdsSpec

/-!
# ProvisionsAndThresholdsTests — 読替・割合・施行・重量
-/
namespace JapanTaxLaw.ProvisionsAndThresholdsTests

open JapanTaxLaw.ProvisionsAndThresholds

theorem substitute_spec (o n x : Nat) :
    substituteText o n x = JapanTaxLaw.ProvisionsAndThresholdsSpec.substituteSpec o n x := by rfl

theorem at_least_spec (p t : Nat) :
    percentAtLeast p t = true ↔ JapanTaxLaw.ProvisionsAndThresholdsSpec.atLeastSpec p t := by
  simp [percentAtLeast, JapanTaxLaw.ProvisionsAndThresholdsSpec.atLeastSpec]

theorem below_spec (p t : Nat) :
    percentBelow p t = true ↔ JapanTaxLaw.ProvisionsAndThresholdsSpec.belowSpec p t := by
  simp [percentBelow, JapanTaxLaw.ProvisionsAndThresholdsSpec.belowSpec]

theorem effective_spec (d t : Nat) :
    effectiveFrom d t = true ↔ JapanTaxLaw.ProvisionsAndThresholdsSpec.effectiveSpec d t := by
  simp [effectiveFrom, JapanTaxLaw.ProvisionsAndThresholdsSpec.effectiveSpec]

theorem under_spec (w : Nat) :
    underHalfTon w = JapanTaxLaw.ProvisionsAndThresholdsSpec.underSpec w := by rfl

theorem delegated_spec (c : Nat) :
    delegatedTransitional2 c = JapanTaxLaw.ProvisionsAndThresholdsSpec.delegatedSpec c := by rfl

example (o n : Nat) : substituteText o n o = n := substitute_matched o n
example (x o n : Nat) (h : x ≠ o) : substituteText o n x = x := substitute_unaffected x o n h
example (t : Nat) : applyAnalogously t = t := analogous_identity t
example (t : Nat) : percentAtLeast t t = true := percent_boundary t
example (t : Nat) : percentBelow t t = false := percent_below_boundary t
example (p t : Nat) : ¬ (percentAtLeast p t = true ∧ percentBelow p t = true) := percent_exclusive p t
example (t : Nat) : followingProvisions t = t := following_identity t
example (t : Nat) : effectiveFrom t t = true := effective_at t
example (d t : Nat) (h : t <= d) : effectiveFrom d t = true := effective_after d t h
example (t : Nat) : parallelApplication t = t := parallel_identity t
example (w : Nat) : underHalfTon w = true ↔ overHalfTon w = false := half_ton_complement w
example (c : Nat) : delegatedTransitional2 c = c := transitional_identity c
example : extraterritorialExecution = true := execution_outside_declared

end JapanTaxLaw.ProvisionsAndThresholdsTests
