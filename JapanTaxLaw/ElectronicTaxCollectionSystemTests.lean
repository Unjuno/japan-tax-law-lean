import JapanTaxLaw.ElectronicTaxCollectionSystem
import JapanTaxLaw.ElectronicTaxCollectionSystemSpec

/-! # ElectronicTaxCollectionSystem tests — kernel-decided boundary examples -/

namespace JapanTaxLaw.ElectronicTaxCollectionSystem

-- Boundary category 1: all three elements present, non-customs
example : qualifies false true true true = true := by decide
example : specQualifies false true true true = true := by decide

-- Boundary category 2: customs exclusion (例外)
example : qualifies true true true true = false := by decide
example : specQualifies true true true true = false := by decide

-- Boundary category 3/4: each missing element
example : qualifies false false true true = false := by decide
example : qualifies false true false true = false := by decide
example : qualifies false true true false = false := by decide
example : specQualifies false false true true = false := by decide

-- Boundary category: element count 0 / below / at the statutory three elements
example : satisfiedElements false false false = 0 := by decide
example : satisfiedElements false true false = 1 := by decide
example : satisfiedElements false true true = 2 := by decide
example : satisfiedElements true true true = 3 := by decide
example : specCount false false false = 0 := by decide
example : specCount true true true = 3 := by decide
example : requiredElements = 3 := by decide
example : specRequired = 3 := by decide

-- Universal agreement (all four Bool inputs):
#check spec_agrees
#check count_agrees

end JapanTaxLaw.ElectronicTaxCollectionSystem
