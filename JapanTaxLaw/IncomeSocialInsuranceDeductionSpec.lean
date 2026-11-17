import JapanTaxLaw.IncomeSocialInsuranceDeduction

/-!
# IncomeSocialInsuranceDeduction spec — 所得税法 art. 74（社会保険料控除）の独立整数定式

Sources (pinned; identical to IncomeSocialInsuranceDeduction.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This file restates the statutory arithmetic independently in plain `Nat`, without
referencing any implementation constant. The deduction amount is written as the paid
amount itself (原文に上限・率なし). The after-deduction amount uses an explicit `if
paid ≤ totalIncome then totalIncome - paid else 0` rather than relying on Nat
subtraction underflow. `agreeIncomeSocialInsuranceDeduction` checks that the
implementation and this independent restatement coincide on a finite grid of inputs
(kernel `decide`); it is NOT a universal claim.

Scope boundaries are identical to the implementation. In particular the eligibility
facts (社会保険料該当性、居住者であること、負担すべき親族の範囲、支払額の算定) are
caller-established and are never used to derive an amount inside this model.
-/

namespace JapanTaxLaw.IncomeSocialInsuranceDeduction

-- ==== art. 74: 独立定式（impl の定数を参照しない） ====

/-- art. 74(1): 控除額 = 支払額そのもの（上限・率なし）。 -/
def specSocialInsuranceDeduction (paidAmount : Nat) : Nat := paidAmount

/-- art. 74(1): 控除後 = 総所得 − 支払額、ただし支払額が総所得を超えるなら 0
    （saturating）。 -/
def specTaxableAfterSocialInsurance (totalIncome paid : Nat) : Nat :=
  if paid ≤ totalIncome then totalIncome - paid else 0

-- ==== points（独立定式のスモーク） ====

example : specSocialInsuranceDeduction 0 = 0 := by decide
example : specSocialInsuranceDeduction 250_000 = 250_000 := by decide
example : specSocialInsuranceDeduction 1_234_567 = 1_234_567 := by decide

example : specTaxableAfterSocialInsurance 1_000_000 250_000 = 750_000 := by decide
example : specTaxableAfterSocialInsurance 250_000 250_000 = 0 := by decide
example : specTaxableAfterSocialInsurance 100_000 250_000 = 0 := by decide
example : specTaxableAfterSocialInsurance 0 0 = 0 := by decide
example : specTaxableAfterSocialInsurance 101 3 = 98 := by decide

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 実装と独立定式が有限グリッド上で一致するか（列挙された点のみ；全称主張ではない）。 -/
def agreeIncomeSocialInsuranceDeduction : Bool :=
  let totals := [0, 1, 3, 100_000, 100_001, 249_999, 250_000, 250_001, 1_000_000, 12_345_678]
  let paids := [0, 1, 3, 7, 99, 100, 101, 250_000, 250_001, 1_000_000, 12_345_678]
  totals.all fun t =>
    paids.all fun p =>
      (socialInsuranceDeduction p == specSocialInsuranceDeduction p) &&
      (taxableAfterSocialInsurance t p == specTaxableAfterSocialInsurance t p)

example : agreeIncomeSocialInsuranceDeduction = true := by decide

end JapanTaxLaw.IncomeSocialInsuranceDeduction
