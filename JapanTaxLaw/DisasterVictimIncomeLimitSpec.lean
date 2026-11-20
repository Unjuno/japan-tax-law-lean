import JapanTaxLaw.DisasterVictimIncomeLimit

/-!
# DisasterVictimIncomeLimitSpec — independent spec for 災害被害者租税減免法 art.2(1)

Law id: 322AC0000000175
Revision: 322AC0000000175_20220101_503AC0000000011
Statutory article: art. 2(1) condition 「合計所得金額が七百五十万円以下であるとき」
Normative unit: NORM|ef7f5c0f1105d358392be865c4f7bac9f076278926d6a9faa8be0e5f000d68a2

The implementation states the condition as `totalIncome ≤ incomeLimit`. The spec
uses a deliberately different formulation: `totalIncome - incomeLimit = 0`
(truncated Nat subtraction). For Nat, `n ≤ m` iff `n - m = 0`; the kernel proves
this equivalence for ALL incomes, not a finite sample.

Boundary theorems are universal over their variables.

Not modelled: other art.2(1) conditions, the substantive relief/deferment effects,
政令 details and the definition of 合計所得金額.
-/

namespace JapanTaxLaw.DisasterVictimIncomeLimit

open JapanTaxLaw.TaxFinance

/-- Independent spec: truncated-subtraction formulation (different from ≤). -/
def specWithinIncomeLimit (totalIncome : Money) : Prop :=
  totalIncome - incomeLimit = 0

/-- Correspondence for all incomes. Universal, kernel-checked. -/
theorem agree_income_limit (totalIncome : Money) :
    withinIncomeLimit totalIncome ↔ specWithinIncomeLimit totalIncome := by
  unfold withinIncomeLimit specWithinIncomeLimit
  exact Nat.sub_eq_zero_iff_le.symm

/-- Boundary: income exactly at the limit satisfies the condition (closed value). -/
theorem income_at_limit : withinIncomeLimit incomeLimit := by
  unfold withinIncomeLimit incomeLimit
  decide

/-- Boundary: income one yen over the limit fails (closed value). -/
theorem income_one_over_fails : ¬ withinIncomeLimit (incomeLimit + 1) := by
  unfold withinIncomeLimit incomeLimit
  decide

/-- Monotonicity: a smaller income also satisfies the condition (all variables). -/
theorem income_monotone {a b : Money} (h : withinIncomeLimit a) (hle : b ≤ a) :
    withinIncomeLimit b := by
  unfold withinIncomeLimit at h ⊢
  exact Nat.le_trans hle h

/-- Finite smoke check (Bool) only; `agree_income_limit` is the universal proof. -/
def checkIncomeLimit (totalIncome : Money) : Bool := totalIncome <= incomeLimit

example : checkIncomeLimit 0 = true := by decide
example : checkIncomeLimit 7_500_000 = true := by decide
example : checkIncomeLimit 7_500_001 = false := by decide

end JapanTaxLaw.DisasterVictimIncomeLimit
