import JapanTaxLaw.ForeignBankShareOver50

/-! # ForeignBankShareOver50 tests — 50%境界 (law 332CO0000000043 / art.39の17) -/

namespace JapanTaxLaw.ForeignBankShareOver50

example : over50 0 = false := by decide
example : over50 49 = false := by decide
example : over50 50 = false := by decide
example : over50 51 = true := by decide
example : over50 100 = true := by decide

end JapanTaxLaw.ForeignBankShareOver50
