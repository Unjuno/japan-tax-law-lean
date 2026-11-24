import JapanTaxLaw.DelegatedEnforcement3M
import JapanTaxLaw.DelegatedEnforcement3MSpec

/-
# DelegatedEnforcement3MTests — kernel-decided boundary + agreement checks

Window 三月を超えない = n <= 3, INCLUSIVE at 3. Boundary categories
registered: zero (0), small_input (1/2), threshold_below (2),
threshold_at (3), threshold_above (4). The exact delegated date is
caller-established and NOT MODELLED.
-/

namespace JapanTaxLaw.DelegatedEnforcement3M

example : withinWindow 0 = true := by decide
example : withinWindow 1 = true := by decide
example : withinWindow 2 = true := by decide
example : withinWindow 3 = true := by decide
example : withinWindow 4 = false := by decide

example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 2 = true := by decide
example : specWithin 3 = true := by decide
example : specWithin 4 = false := by decide

example : windowMonths = 3 := windowMonths_value
example : windowMonths = specWindowMonths := agreeWindowMonths
example : withinWindow 0 = specWithin 0 := agreeWithin 0
example : withinWindow 1 = specWithin 1 := agreeWithin 1
example : withinWindow 2 = specWithin 2 := agreeWithin 2
example : withinWindow 3 = specWithin 3 := agreeWithin 3
example : withinWindow 4 = specWithin 4 := agreeWithin 4
example (n : Nat) : withinWindow n = specWithin n := agreeWithin n

end JapanTaxLaw.DelegatedEnforcement3M
