import JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10MSpec

/-!
# IncomeTaxSpouseIncomeCeiling10M tests — kernel-decided boundary checks

Pinned to law 340AC0000000033 / revision 340AC0000000033_20261001_507AC0000000070.
境界: 9,999,999 / 10,000,000 / 10,000,001 円。
-/

namespace JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M

example : spouseQualifies 0 = true := by decide
example : spouseQualifies 1 = true := by decide
example : spouseQualifies 9999999 = true := by decide
example : spouseQualifies 10000000 = true := by decide
example : spouseQualifies 10000001 = false := by decide
example : specWithinCeiling 9999999 = true := by decide
example : specWithinCeiling 10000001 = false := by decide
example : incomeCeiling = specCeilingYen := by decide

end JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M
