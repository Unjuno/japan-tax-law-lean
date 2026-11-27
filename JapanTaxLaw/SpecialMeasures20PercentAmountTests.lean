import JapanTaxLaw.SpecialMeasures20PercentAmount

/-! # SpecialMeasures20PercentAmount tests — 20%算定 (law 332AC0000000026 / art.42の14) -/

namespace JapanTaxLaw.SpecialMeasures20PercentAmount

example : amount 0 = 0 := by decide
example : amount 1 = 0 := by decide
example : amount 99 = 19 := by decide
example : amount 100 = 20 := by decide
example : amount 101 = 20 := by decide
example : amount 1_000 = 200 := by decide
example : amount 10_001 = 2_000 := by decide

end JapanTaxLaw.SpecialMeasures20PercentAmount
