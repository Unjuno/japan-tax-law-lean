import JapanTaxLaw.BlueBusinessDeductAmount

/-! # BlueBusinessDeductAmount tests — 20歳境界のカーネル決定検査 (law 340AC0000000033 / art.3) -/

namespace JapanTaxLaw.BlueBusinessDeductAmount

example : amount 0 = 217_500 := by decide
example : amount 18 = 217_500 := by decide
example : amount 19 = 217_500 := by decide
example : amount 20 = 225_000 := by decide
example : amount 21 = 225_000 := by decide
example : amount 30 = 225_000 := by decide
example : amount 100 = 225_000 := by decide

end JapanTaxLaw.BlueBusinessDeductAmount
