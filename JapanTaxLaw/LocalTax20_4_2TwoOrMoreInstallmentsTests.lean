import JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallmentsSpec

/- Kernel-decided boundary checks for 「地方税の確定金額を、二以上の納期限を定め、一定の金額に分割して納付し、又は納入することとされている場合において、その納期限ごとの分割金額に千円未満の端数があるとき、又はその分割金額の全額が千円未満であるときは、その端数金額又はその全額は、すべて最初の納期限に係る分割金額に合算するものとする。」. -/
namespace JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments
