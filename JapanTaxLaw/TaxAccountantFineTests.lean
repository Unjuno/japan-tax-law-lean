import JapanTaxLaw.TaxAccountantFine
import JapanTaxLaw.TaxAccountantFineSpec

/-!
# TaxAccountantFineTests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.TaxAccountantFineTests

open JapanTaxLaw.TaxAccountantFine
open JapanTaxLaw.TaxAccountantFineSpec

/-- 実装と独立仕様の対応（仕様は実装を参照しない）。 -/
theorem agrees_with_implementation (eligible : Bool) (fine : Nat) :
    mayImposeFine eligible fine = true ↔ permittedFine eligible fine := by
  by_cases hf : fine <= 100_000 <;>
    simp [mayImposeFine, permittedFine, penaltyCeilingYen, hf]

-- ==== kernel-decided examples ====
example : penaltyCeilingYen = 100_000 := by decide
example : mayImposeFine true 0 = true := by decide
example : mayImposeFine true 99_999 = true := by decide
example : mayImposeFine true 100_000 = true := by decide
example : mayImposeFine true 100_001 = false := by decide
example : mayImposeFine false 100_000 = false := by decide
example : permittedFine true 100_000 := by unfold permittedFine; decide
example : ¬ permittedFine true 100_001 := by unfold permittedFine; decide
example : ¬ permittedFine false 0 := by unfold permittedFine; decide

end JapanTaxLaw.TaxAccountantFineTests
