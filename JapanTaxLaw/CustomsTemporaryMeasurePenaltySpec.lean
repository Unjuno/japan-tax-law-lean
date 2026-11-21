import JapanTaxLaw.CustomsTemporaryMeasurePenalty

/-!
# CustomsTemporaryMeasurePenaltySpec — independent spec for 関税暫定措置法 第十六条(1)

Law id: 335AC0000000036 (関税暫定措置法, Act)
Revision: 335AC0000000036_20260401_508AC0000000005
Article: 第十六条(1) — imprisonment ≤ 12 months OR fine ≤ ¥2,000,000
Normative unit: NORM|73d5c75ef83e6b9a1c99a74d31835bff840a92e8813407f099b58a630c21ad9e

The Bool `withinLimits` is matched by an independent Prop spec using
successor-strict membership (`m < succ 12`, `y < succ 2000000`) — a distinct
formulation. The kernel proves the Bool/Prop correspondence for ALL penalties,
axiom-free via core Nat lemmas (`Nat.le_of_ble_eq_true`, `Nat.ble_eq_true_of_le`,
`Nat.le_of_lt_succ`).

Boundary values: 12 months / ¥2,000,000 qualify; 13 months / ¥2,000,001 fail.

Not modelled: violation conditions (各号), sentencing, other paragraphs/articles.
-/

namespace JapanTaxLaw.CustomsTemporaryMeasurePenalty

open JapanTaxLaw.TaxFinance

/-- Independent Prop spec: successor-strict form of each inclusive ceiling. -/
def specWithinLimits : Penalty -> Prop
  | Penalty.imprisonment m => m < Nat.succ maxImprisonmentMonths
  | Penalty.fine y => y < Nat.succ maxFineYen

/-- Bool implementation and Prop spec agree for all penalties. -/
theorem agree_within_limits (p : Penalty) : withinLimits p = true ↔ specWithinLimits p := by
  cases p with
  | imprisonment m =>
      unfold withinLimits specWithinLimits
      constructor
      · intro h
        exact Nat.lt_of_le_of_lt (Nat.le_of_ble_eq_true h) (Nat.lt_succ_self _)
      · intro h
        exact Nat.ble_eq_true_of_le (Nat.le_of_lt_succ h)
  | fine y =>
      unfold withinLimits specWithinLimits
      constructor
      · intro h
        exact Nat.lt_of_le_of_lt (Nat.le_of_ble_eq_true h) (Nat.lt_succ_self _)
      · intro h
        exact Nat.ble_eq_true_of_le (Nat.le_of_lt_succ h)

end JapanTaxLaw.CustomsTemporaryMeasurePenalty
