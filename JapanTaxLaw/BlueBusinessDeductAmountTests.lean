import JapanTaxLaw.BlueBusinessDeductAmount

/-! # BlueBusinessDeductAmount tests — 年齢分岐のカーネル決定検査 (law 340AC0000000033 / art.3) -/

namespace JapanTaxLaw.BlueBusinessDeductAmount

example : amount false = 225_000 := by decide
example : amount true = 217_500 := by decide
example : amount true < amount false := by decide
example : amount false > amount true := by decide
example : amount false - amount true = 7_500 := by decide
example : amount true + 7_500 = amount false := by decide

end JapanTaxLaw.BlueBusinessDeductAmount
