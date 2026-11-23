import JapanTaxLaw.MergerGrantFiscalWindowSpec

/-
Kernel-decided boundary examples for MergerGrantFiscalWindow (inclusive [47,52]).
Covers zero / small_input / threshold_below (46) / threshold_at (47, 52) /
threshold_above (53), plus impl/spec agreement via kernel-checked bridge theorems.
-/

namespace JapanTaxLaw.MergerGrantFiscalWindowTests

open JapanTaxLaw.MergerGrantFiscalWindow
open JapanTaxLaw.MergerGrantFiscalWindowSpec

example : inGrantWindow 0 = false := by decide
example : inGrantWindow 1 = false := by decide
example : inGrantWindow 45 = false := by decide
example : inGrantWindow 46 = false := by decide
example : inGrantWindow 47 = true := by decide
example : inGrantWindow 50 = true := by decide
example : inGrantWindow 52 = true := by decide
example : inGrantWindow 53 = false := by decide
example : inGrantWindow 54 = false := by decide

example : specInWindow 0 = false := by decide
example : specInWindow 46 = false := by decide
example : specInWindow 47 = true := by decide
example : specInWindow 52 = true := by decide
example : specInWindow 53 = false := by decide

example : windowStartFY = 47 := windowStartFY_value
example : windowEndFY = 52 := windowEndFY_value
example : inGrantWindow 46 = false := inGrantWindow_46
example : inGrantWindow 47 = true := inGrantWindow_47
example : inGrantWindow 50 = true := inGrantWindow_50
example : inGrantWindow 52 = true := inGrantWindow_52
example : inGrantWindow 53 = false := inGrantWindow_53

example : windowStartFY = specStart := agreeStart
example : windowEndFY = specEnd := agreeEnd
example : inGrantWindow 47 = specInWindow 47 := agreeWindow 47
example : inGrantWindow 52 = specInWindow 52 := agreeWindow 52

end JapanTaxLaw.MergerGrantFiscalWindowTests
