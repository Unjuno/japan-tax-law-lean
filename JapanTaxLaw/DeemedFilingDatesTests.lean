import JapanTaxLaw.DeemedFilingDates
import JapanTaxLaw.DeemedFilingDatesSpec

/-!
# DeemedFilingDatesTests — 分岐・仕様一致・三文言の同一性
-/
namespace JapanTaxLaw.DeemedFilingDatesTests

open JapanTaxLaw.DeemedFilingDates

theorem spec_agree (written : Written) (deemed : Nat) :
    ruleA written deemed = JapanTaxLaw.DeemedFilingDatesSpec.effectiveSpec written deemed := by
  cases written <;> rfl

example : ruleA (some 100) 999 = 100 := by decide
example : ruleA none 999 = 999 := by decide
example : ruleB none 999 = 999 := by decide
example : ruleC (some 7) 999 = 7 := by decide
example (d deemed : Nat) : ruleA (some d) deemed = d := written_branch d deemed
example (deemed : Nat) : ruleA none deemed = deemed := deemed_branch deemed
example (w : Written) : w = none ∨ ∃ d, w = some d := branch_exhaustive w
example (w : Written) : ∃ r, ruleA w 0 = r := total w 0
example (w : Written) (d : Nat) : ruleA w d = ruleB w d := ruleA_eq_ruleB w d
example (w : Written) (d : Nat) : ruleA w d = ruleC w d := ruleA_eq_ruleC w d
example (w : Written) (d deemed : Nat) (h : w = some d) :
    ruleA w deemed = d ∧ ruleB w deemed = d ∧ ruleC w deemed = d :=
  all_three_branches_agree w deemed d h

end JapanTaxLaw.DeemedFilingDatesTests
