import JapanTaxLaw.PreparedRiceCerealMaterial
import JapanTaxLaw.PreparedRiceCerealMaterialSpec

/-! # PreparedRiceCerealMaterial tests — kernel-decided boundary examples -/

namespace JapanTaxLaw.PreparedRiceCerealMaterial

-- All five elements present
example : qualifies true true true true true = true := by decide
example : specQualifies true true true true true = true := by decide

-- One missing element suffices to fail
example : qualifies false true true true true = false := by decide
example : qualifies true true true true false = false := by decide

-- Numeric boundary categories: 0 / 1 / 4 (below) / 5 (at) / 16 (above)
example : satisfiedMask 0 = 0 := by decide
example : satisfiedMask 1 = 1 := by decide
example : satisfiedMask 15 = 4 := by decide
example : satisfiedMask 31 = 5 := by decide
example : specMaskCount 0 = 0 := by decide
example : specMaskCount 1 = 1 := by decide
example : specMaskCount 15 = 4 := by decide
example : specMaskCount 31 = 5 := by decide
example : requiredCount = 5 := by decide
example : specRequired = 5 := by decide

#check spec_agrees
#check count_agrees

end JapanTaxLaw.PreparedRiceCerealMaterial
