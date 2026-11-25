import JapanTaxLaw.EqualLevyIncomeRequirement

/-!
# EqualLevyIncomeRequirement tests — 均等割所得要件 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
500万円以下（ちょうど可）。
-/

namespace JapanTaxLaw.EqualLevyIncomeRequirement

example : meetsIncomeRequirement 5000000 = true := by decide
example : meetsIncomeRequirement 5000001 = false := by decide

end JapanTaxLaw.EqualLevyIncomeRequirement
