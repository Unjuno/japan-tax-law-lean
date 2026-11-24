import JapanTaxLaw.SpecialDeductionBaseSpec

/-! Regression tests — 9 特別控除関連数値 (7 控除額 + 2 閾値). -/

namespace JapanTaxLaw.SpecialDeductionBase

example : amountOf DeductionKind.prepaymentSpecial = (30_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.salarySpecial = (30_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.yearEndSpecial = (30_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.pensionSpecial = (30_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.housingLoanCap = (500_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.forestIncome = (500_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.lumpSumIncome = (500_000, AmountRole.deductionBase) := by decide
example : amountOf DeductionKind.relativeSpecialThreshold1 = (850_000, AmountRole.incomeThreshold) := by decide
example : amountOf DeductionKind.relativeSpecialThreshold2 = (850_000, AmountRole.incomeThreshold) := by decide
example : amountOf DeductionKind.relativeSpecialThreshold1 = specAmount DeductionKind.relativeSpecialThreshold1 := agreeAmounts _
example : (amountOf DeductionKind.prepaymentSpecial).1 > 0 := amountPositive _

end JapanTaxLaw.SpecialDeductionBase
