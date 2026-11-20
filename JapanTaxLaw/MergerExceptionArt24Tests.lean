import JapanTaxLaw.MergerExceptionArt24
import JapanTaxLaw.MergerExceptionArt24Spec

/-!
# MergerExceptionArt24Tests — kernel-decided branch examples
-/
namespace JapanTaxLaw.MergerExceptionArt24Tests

open JapanTaxLaw.MergerExceptionArt24
open JapanTaxLaw.MergerExceptionArt24Spec

theorem agrees_with_implementation (m q : Bool) :
    isCoveredMerger m q = true ↔ inScope m q := by
  cases m <;> cases q <;> simp [isCoveredMerger, inScope]

example : isCoveredMerger true false = true := by decide
example : isCoveredMerger true true = false := by decide
example : isCoveredMerger false false = false := by decide
example : isCoveredMerger false true = false := by decide
example : inScope true false := by unfold inScope; decide
example : ¬ inScope true true := by unfold inScope; decide

end JapanTaxLaw.MergerExceptionArt24Tests
