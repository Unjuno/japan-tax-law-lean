import JapanTaxLaw.DelegatedEnforcement6M
import JapanTaxLaw.DelegatedEnforcement6MSpec

/-
# DelegatedEnforcement6MTests — kernel-decided boundary + agreement checks

Window 六月を超えない = n <= 6, INCLUSIVE at 6. Boundary categories
registered: zero (0), small_input (1/5), threshold_below (5),
threshold_at (6), threshold_above (7). The exact delegated date
(施行日) is caller-established and NOT MODELLED.
-/

namespace JapanTaxLaw.DelegatedEnforcement6M

example : withinWindow 0 = true := by decide
example : withinWindow 1 = true := by decide
example : withinWindow 5 = true := by decide
example : withinWindow 6 = true := by decide
example : withinWindow 7 = false := by decide

example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 5 = true := by decide
example : specWithin 6 = true := by decide
example : specWithin 7 = false := by decide

example : windowMonths = 6 := windowMonths_value
example : windowMonths = specWindowMonths := agreeWindowMonths
example : withinWindow 0 = specWithin 0 := agreeWithin 0
example : withinWindow 1 = specWithin 1 := agreeWithin 1
example : withinWindow 5 = specWithin 5 := agreeWithin 5
example : withinWindow 6 = specWithin 6 := agreeWithin 6
example : withinWindow 7 = specWithin 7 := agreeWithin 7
example (n : Nat) : withinWindow n = specWithin n := agreeWithin n

end JapanTaxLaw.DelegatedEnforcement6M
