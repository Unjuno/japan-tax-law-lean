import JapanTaxLaw.InheritanceTaxDelinquencyException

/-!
# InheritanceTaxDelinquencyExceptionSpec — independent spec for 相続税法 第三十八条(4)

Law id: 325AC0000000073 (相続税法, Act)
Revision: 325AC0000000073_20260401_506AC0000000008
Article: 第三十八条(4) — 延納税額百万円以下かつ延納期間三年以下の例外
Normative unit: NORM|6c27921434c59ba57a352e0bf3f7ff011871be1423b177bd348091a1ab4d0156

The implementation uses `delinquencyYen ≤ maxDelinquencyYen ∧ periodYears ≤ maxPeriodYears`.
The independent spec reformulates using a successor-based strict form:
`delinquencyYen < Nat.succ maxDelinquencyYen ∧ periodYears < Nat.succ maxPeriodYears`
(equivalent via `Nat.lt_succ_iff`, but a distinct formulation). The kernel proves
equivalence for ALL delinquency amounts and periods.

Boundary theorems: ¥1,000,000 and 3 years qualify (以下 = inclusive); ¥1,000,001
and 4 years fail. Conjunction is honored (either conjunct failing ⇒ no exception).

Not modelled: the preceding rule that 「この限りでない」 overrides, computation of
延納税額 / 延納期間, other paragraphs and other articles.
-/

namespace JapanTaxLaw.InheritanceTaxDelinquencyException

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based strict form for both inclusive upper bounds. -/
def specException (delinquencyYen : Money) (periodYears : Nat) : Prop :=
  delinquencyYen < Nat.succ maxDelinquencyYen ∧ periodYears < Nat.succ maxPeriodYears

/-- Correspondence for all amounts and periods. Universal, kernel-checked. -/
theorem agree_exception (delinquencyYen : Money) (periodYears : Nat) :
    exceptionApplies delinquencyYen periodYears ↔ specException delinquencyYen periodYears := by
  unfold exceptionApplies specException
  constructor
  · intro h
    exact ⟨Nat.lt_of_le_of_lt h.1 (Nat.lt_succ_self _), Nat.lt_of_le_of_lt h.2 (Nat.lt_succ_self _)⟩
  · intro h
    exact ⟨Nat.le_of_lt_succ h.1, Nat.le_of_lt_succ h.2⟩

/-- Both conjuncts at the inclusive limit qualify. -/
theorem at_limit : exceptionApplies 1_000_000 3 := by
  unfold exceptionApplies maxDelinquencyYen maxPeriodYears
  decide

/-- Amount one yen above the limit fails (period still within limit). -/
theorem amount_above : ¬ exceptionApplies 1_000_001 3 := by
  unfold exceptionApplies maxDelinquencyYen maxPeriodYears
  decide

/-- Period one year above the limit fails (amount still within limit). -/
theorem period_above : ¬ exceptionApplies 1_000_000 4 := by
  unfold exceptionApplies maxDelinquencyYen maxPeriodYears
  decide

/-- Both well within limits qualify. -/
theorem both_below : exceptionApplies 999_999 2 := by
  unfold exceptionApplies maxDelinquencyYen maxPeriodYears
  decide

/-- Constants decoded correctly: 百万円 = 1,000,000; 三年 = 3. -/
theorem constants_decoded : maxDelinquencyYen = 1_000_000 ∧ maxPeriodYears = 3 := by
  constructor <;> rfl

end JapanTaxLaw.InheritanceTaxDelinquencyException
