import JapanTaxLaw.FiscalPeriodSixMonthSplit
import JapanTaxLaw.FiscalPeriodSixMonthSplitSpec

/-!
# FiscalPeriodSixMonthSplitTests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.FiscalPeriodSixMonthSplitTests

open JapanTaxLaw.FiscalPeriodSixMonthSplit
open JapanTaxLaw.FiscalPeriodSixMonthSplitSpec

theorem agrees_under (m : Nat) : isUnderSixMonths m = true ↔ underSpec m := by
  by_cases h : m < 6 <;> simp [isUnderSixMonths, underSpec, sixMonths, h]

theorem agrees_more (m : Nat) : isSixMonthsOrMore m = true ↔ moreSpec m := by
  by_cases h : 6 <= m <;> simp [isSixMonthsOrMore, moreSpec, sixMonths, h]

example : isUnderSixMonths 0 = true := by decide
example : isUnderSixMonths 5 = true := by decide
example : isUnderSixMonths 6 = false := by decide
example : isSixMonthsOrMore 6 = true := by decide
example : isSixMonthsOrMore 7 = true := by decide
example : isSixMonthsOrMore 5 = false := by decide
example : ¬ (isUnderSixMonths 5 = true ∧ isSixMonthsOrMore 5 = true) := by
  exact exclusive 5
example : ¬ (isUnderSixMonths 6 = true ∧ isSixMonthsOrMore 6 = true) := by
  exact exclusive 6
example : isUnderSixMonths 0 = true ∨ isSixMonthsOrMore 0 = true := by
  exact exhaustive 0
example : isUnderSixMonths 100 = true ∨ isSixMonthsOrMore 100 = true := by
  exact exhaustive 100

end JapanTaxLaw.FiscalPeriodSixMonthSplitTests
