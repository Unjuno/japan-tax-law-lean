import JapanTaxLaw.SpecialDeductionBase

/-! Independent amount table and universal agreement. -/

namespace JapanTaxLaw.SpecialDeductionBase

def amountTable : List (DeductionKind × Nat × AmountRole) :=
  [ (DeductionKind.prepaymentSpecial, 30_000, AmountRole.deductionBase),
    (DeductionKind.salarySpecial, 30_000, AmountRole.deductionBase),
    (DeductionKind.yearEndSpecial, 30_000, AmountRole.deductionBase),
    (DeductionKind.pensionSpecial, 30_000, AmountRole.deductionBase),
    (DeductionKind.housingLoanCap, 500_000, AmountRole.deductionBase),
    (DeductionKind.forestIncome, 500_000, AmountRole.deductionBase),
    (DeductionKind.lumpSumIncome, 500_000, AmountRole.deductionBase),
    (DeductionKind.relativeSpecialThreshold1, 850_000, AmountRole.incomeThreshold),
    (DeductionKind.relativeSpecialThreshold2, 850_000, AmountRole.incomeThreshold) ]

def specAmount (k : DeductionKind) : Nat × AmountRole :=
  match amountTable.find? (fun p => p.1 == k) with
  | some p => (p.2.1, p.2.2)
  | none => (0, AmountRole.deductionBase)

theorem agreeAmounts (k : DeductionKind) : amountOf k = specAmount k := by
  cases k <;> native_decide

end JapanTaxLaw.SpecialDeductionBase
