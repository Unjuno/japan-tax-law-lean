import JapanTaxLaw.IndustrialEquipmentCost32MSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.IndustrialEquipmentCost32MTests

open JapanTaxLaw.IndustrialEquipmentCost32M
open JapanTaxLaw.IndustrialEquipmentCost32MSpec

example : triggered 0 = false := by decide
example : triggered 1 = false := by decide
example : triggered 31999999 = false := by decide
example : triggered 32000000 = false := by decide
example : triggered 32000001 = true := by decide
example : specTriggered 31999999 = false := by decide
example : specTriggered 32000000 = false := by decide
example : specTriggered 32000001 = true := by decide
example : agree 31999999 := agree_thm 31999999
example : agree 32000000 := agree_thm 32000000
example : agree 32000001 := agree_thm 32000001

end JapanTaxLaw.IndustrialEquipmentCost32MTests
