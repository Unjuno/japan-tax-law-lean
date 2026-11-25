import JapanTaxLaw.DisasterLiquorDeduction500YenFloorSpec

/-!
# DisasterLiquorDeduction500YenFloor tests — kernel-decided boundary checks

Pinned to law 322AC0000000175 / revision 322AC0000000175_20220101_503AC0000000011.
境界: 0 / 499 / 500 / 501（五百円未満は控除しない）。
-/

namespace JapanTaxLaw.DisasterLiquorDeduction500YenFloor

example : deductionApplied 0 = false := by decide
example : deductionApplied 1 = false := by decide
example : deductionApplied 499 = false := by decide
example : deductionApplied 500 = true := by decide
example : deductionApplied 501 = true := by decide
example : effectiveDeduction 499 = 0 := by decide
example : effectiveDeduction 500 = 500 := by decide
example : specDeductible 499 = false := by decide
example : specEffective 501 = 501 := by decide

end JapanTaxLaw.DisasterLiquorDeduction500YenFloor
