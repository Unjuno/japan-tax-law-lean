import JapanTaxLaw.ForestTaxEligibilityException
import JapanTaxLaw.ForestTaxEligibilityExceptionSpec

/-
# ForestTaxEligibilityExceptionTests — kernel-decided boundary + agreement checks

Pinned: law 431AC0000000003 / revision 431AC0000000003_20260401_508AC0000000002.
All checks are kernel-decided (`rfl` / `by decide`). Boundary categories
registered with literals={1350000}: zero, small_input, threshold_below
(1_349_999), threshold_at (1_350_000), threshold_above (1_350_001).
-/

namespace JapanTaxLaw.ForestTaxEligibilityException

-- (a) category membership: four enumerated categories true, one non-category false
example : isQualifyingCategory "障害者" = true := by decide
example : isQualifyingCategory "未成年者" = true := by decide
example : isQualifyingCategory "寡婦" = true := by decide
example : isQualifyingCategory "ひとり親" = true := by decide
example : isQualifyingCategory "一般" = false := by decide

-- (b) income boundaries: zero / small / just-below / at / just-above the ceiling
example : eligible "障害者" 0 = true := by decide
example : eligible "障害者" 1 = true := by decide
example : eligible "障害者" 1_349_999 = true := by decide
example : eligible "障害者" 1_350_000 = true := by decide
example : eligible "障害者" 1_350_001 = false := by decide

-- (c) combined eligibility across all four categories and the income ceiling
example : eligible "未成年者" 1_350_000 = true := by decide
example : eligible "寡婦" 1_350_001 = false := by decide
example : eligible "ひとり親" 1_349_999 = true := by decide
example : eligible "一般" 0 = false := by decide

-- (d) independent-spec spot checks
example : specCeiling = 1_350_000 := by decide
example : specEligible "障害者" 1_350_000 = true := by decide
example : specEligible "一般" 0 = false := by decide

-- (e) impl/spec agreement: concrete points and the universal axiom-free bridges
example : incomeCeiling = specCeiling := by rfl
example : isQualifyingCategory "障害者" = specCategory "障害者" := by decide
example : isQualifyingCategory "一般" = specCategory "一般" := by decide
example : eligible "障害者" 1_350_000 = specEligible "障害者" 1_350_000 := by decide
example : eligible "障害者" 1_350_001 = specEligible "障害者" 1_350_001 := by decide
example : eligible "一般" 0 = specEligible "一般" 0 := by decide
example : incomeCeiling = specCeiling := agreeCeiling
example (c : String) : isQualifyingCategory c = specCategory c := by
  exact agreeCategory c
example (c : String) (income : Nat) : eligible c income = specEligible c income := by
  exact agreeEligible c income

end JapanTaxLaw.ForestTaxEligibilityException
