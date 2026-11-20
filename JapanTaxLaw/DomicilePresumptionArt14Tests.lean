import JapanTaxLaw.DomicilePresumptionArt14
import JapanTaxLaw.DomicilePresumptionArt14Spec

/-!
# DomicilePresumptionArt14Tests — kernel-decided branch examples
-/
namespace JapanTaxLaw.DomicilePresumptionArt14Tests

open JapanTaxLaw.DomicilePresumptionArt14
open JapanTaxLaw.DomicilePresumptionArt14Spec

theorem agrees_with_implementation (m c : Bool) :
    presumedHasDomicile m c = true ↔ presumedDomicile m c := by
  cases m <;> cases c <;> simp [presumedHasDomicile, presumedDomicile]

example : presumedHasDomicile true true = true := by decide
example : presumedHasDomicile false true = false := by decide
example : presumedHasDomicile true false = false := by decide
example : presumedHasDomicile false false = false := by decide
example : presumedDomicile true true := by unfold presumedDomicile; decide
example : ¬ presumedDomicile false true := by unfold presumedDomicile; decide

end JapanTaxLaw.DomicilePresumptionArt14Tests
