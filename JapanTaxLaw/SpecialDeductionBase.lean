import JapanTaxLaw.TaxFinance

/-!
# SpecialDeductionAmounts — 9 の pinned 特別控除関連数値規定

7 units state a deduction base amount (三万円 / 五十万円). 2 units
(c03e8889fd99, 5fc055a60454) state an income THRESHOLD for 特定親族特別控除額
(前年の合計所得金額が八十五万円以下), NOT a deduction amount. The model records
each pinned numeral with its role; per-person increments, residual caps and
the surrounding 控除 structure are caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.SpecialDeductionBase

/-- 数値の役割: 控除額の基準 or 所得金額の閾値。 -/
inductive AmountRole where
  | deductionBase | incomeThreshold
deriving DecidableEq, Repr

inductive DeductionKind where
  | prepaymentSpecial | salarySpecial | yearEndSpecial | pensionSpecial
  | housingLoanCap | forestIncome | lumpSumIncome
  | relativeSpecialThreshold1 | relativeSpecialThreshold2

deriving DecidableEq, Repr

/-- 実装: (pinned 数値（円）, 役割)。 -/
def amountOf : DeductionKind → Nat × AmountRole
  | DeductionKind.prepaymentSpecial => (30_000, AmountRole.deductionBase)
  | DeductionKind.salarySpecial => (30_000, AmountRole.deductionBase)
  | DeductionKind.yearEndSpecial => (30_000, AmountRole.deductionBase)
  | DeductionKind.pensionSpecial => (30_000, AmountRole.deductionBase)
  | DeductionKind.housingLoanCap => (500_000, AmountRole.deductionBase)
  | DeductionKind.forestIncome => (500_000, AmountRole.deductionBase)
  | DeductionKind.lumpSumIncome => (500_000, AmountRole.deductionBase)
  | DeductionKind.relativeSpecialThreshold1 => (850_000, AmountRole.incomeThreshold)
  | DeductionKind.relativeSpecialThreshold2 => (850_000, AmountRole.incomeThreshold)

theorem amountPositive (k : DeductionKind) : (amountOf k).1 > 0 := by
  cases k <;> decide

end JapanTaxLaw.SpecialDeductionBase
