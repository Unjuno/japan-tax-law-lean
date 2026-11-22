import JapanTaxLaw.AdultAgeThresholdSpec

/-
Kernel-decided boundary examples for AdultAgeThreshold (成年者年齢二十歳以上, inclusive >= 20).
Covers zero / small_input / threshold_below (19) / threshold_at (20) / threshold_above (21),
plus impl/spec agreement via the kernel-checked bridge theorems.
-/

namespace JapanTaxLaw.AdultAgeThresholdTests

open JapanTaxLaw.AdultAgeThreshold
open JapanTaxLaw.AdultAgeThresholdSpec

example : isAdult 0 = false := by decide
example : isAdult 10 = false := by decide
example : isAdult 18 = false := by decide
example : isAdult 19 = false := by decide
example : isAdult 20 = true := by decide
example : isAdult 21 = true := by decide
example : isAdult 100 = true := by decide

example : specAdult 19 = false := by decide
example : specAdult 20 = true := by decide
example : specAdult 21 = true := by decide

example : adultAge = 20 := adultAge_value
example : adultAge = specAge := agreeAge
example : isAdult 19 = specAdult 19 := agreeAdult 19
example : isAdult 20 = specAdult 20 := agreeAdult 20
example : isAdult 21 = specAdult 21 := agreeAdult 21

end JapanTaxLaw.AdultAgeThresholdTests
