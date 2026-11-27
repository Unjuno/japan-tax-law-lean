import JapanTaxLaw.PrivateFundRate20To15

/-! # PrivateFundRate20To15 tests — 20→15 置換 (law 332AC0000000026 / art.8の2) -/

namespace JapanTaxLaw.PrivateFundRate20To15

example : readRate 0 = 0 := by decide
example : readRate 10 = 10 := by decide
example : readRate 19 = 19 := by decide
example : readRate 20 = 15 := by decide
example : readRate 21 = 21 := by decide
example : readRate 25 = 25 := by decide
example : readRate 100 = 100 := by decide

end JapanTaxLaw.PrivateFundRate20To15
