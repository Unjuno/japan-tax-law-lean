import JapanTaxLaw.MiningTaxLevyDate
import JapanTaxLaw.MiningTaxLevyDateSpec

/-!
# MiningTaxLevyDateTests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.MiningTaxLevyDateTests

open JapanTaxLaw.MiningTaxLevyDate
open JapanTaxLaw.MiningTaxLevyDateSpec

theorem agrees_with_implementation (m d : Nat) :
    isLevyDate m d = true ↔ statutoryLevyDate m d := by
  by_cases hm : m = 4 <;> by_cases hd : d = 1 <;>
    simp [isLevyDate, statutoryLevyDate, levyMonth, levyDay, hm, hd]

example : isLevyDate 4 1 = true := by decide
example : isLevyDate 4 2 = false := by decide
example : isLevyDate 3 1 = false := by decide
example : isLevyDate 5 1 = false := by decide
example : statutoryLevyDate 4 1 := by unfold statutoryLevyDate; decide
example : ¬ statutoryLevyDate 4 2 := by unfold statutoryLevyDate; decide

end JapanTaxLaw.MiningTaxLevyDateTests
