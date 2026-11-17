import JapanTaxLaw.IncomeBasicDeduction

/-!
# IncomeBasicDeduction spec — 所得税法 art. 86（基礎控除）の独立整数定式

Sources (pinned; identical to IncomeBasicDeduction.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

This file restates the statutory arithmetic independently in plain `Nat`, without
referencing any implementation constant: the four amounts are written as bare
literals read from 原文 五十八万円 / 四十八万円 / 三十二万円 / 十六万円
(580_000 / 480_000 / 320_000 / 160_000). The 2,500万円超 case is written as an
explicit fall-through to 0 (art. 86(1) の適用外). The bracket choice uses strict
`<` comparisons against `boundary + 1` — an alternate expression of the impl's
`≤` chain. `specTaxableAfterBasicDeduction` uses an explicit `if` rather than
relying on Nat subtraction underflow.

`agreeIncomeBasicDeduction` checks that the implementation and this independent
restatement coincide on a finite grid of total incomes and deductions (kernel
`decide`); it is NOT a universal claim.

Scope boundaries are identical to the implementation. In particular the
eligibility facts (居住者であること・合計所得金額の算定) are caller-established and
are never used to derive an amount inside this model. Only the deduction amount
is modelled — no tax computation, no upper bound, no rounding.
-/ 

namespace JapanTaxLaw.IncomeBasicDeduction

-- ==== art. 86: 独立定式（impl の定数を参照しない） ====

/-- art. 86(1) 一: 五十八万円。 -/
def specBasicDeductionLe2350 : Nat := 580_000

/-- art. 86(1) 二: 四十八万円。 -/
def specBasicDeductionLe2400 : Nat := 480_000

/-- art. 86(1) 三: 三十二万円。 -/
def specBasicDeductionLe2450 : Nat := 320_000

/-- art. 86(1) 四: 十六万円。 -/
def specBasicDeductionLe2500 : Nat := 160_000

/-- art. 86(1): if の別表現（`< boundary+1` による区分選択）。
    2,500万円超は第1項の適用外として 0。 -/
def specBasicDeductionAmount (totalIncome : Nat) : Nat :=
  if totalIncome < 23_500_001 then specBasicDeductionLe2350
  else if totalIncome < 24_000_001 then specBasicDeductionLe2400
  else if totalIncome < 24_500_001 then specBasicDeductionLe2450
  else if totalIncome < 25_000_001 then specBasicDeductionLe2500
  else 0

/-- art. 86: 控除後 = 総所得 − 控除額、ただし総所得が控除額未満なら 0（saturating）。 -/
def specTaxableAfterBasicDeduction (income deduction : Nat) : Nat :=
  if deduction ≤ income then income - deduction else 0

-- ==== points（独立定式のスモーク、全境界値） ====

example : specBasicDeductionLe2350 = 580_000 := by decide
example : specBasicDeductionLe2400 = 480_000 := by decide
example : specBasicDeductionLe2450 = 320_000 := by decide
example : specBasicDeductionLe2500 = 160_000 := by decide

example : specBasicDeductionAmount 23_500_000 = 580_000 := by decide
example : specBasicDeductionAmount 23_500_001 = 480_000 := by decide
example : specBasicDeductionAmount 24_000_000 = 480_000 := by decide
example : specBasicDeductionAmount 24_000_001 = 320_000 := by decide
example : specBasicDeductionAmount 24_500_000 = 320_000 := by decide
example : specBasicDeductionAmount 24_500_001 = 160_000 := by decide
example : specBasicDeductionAmount 25_000_000 = 160_000 := by decide
example : specBasicDeductionAmount 25_000_001 = 0 := by decide

example : specTaxableAfterBasicDeduction 1_000_000 580_000 = 420_000 := by decide
example : specTaxableAfterBasicDeduction 100_000 580_000 = 0 := by decide

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 実装と独立定式が有限グリッド上で一致するか（列挙された点のみ；全称主張ではない）。 -/
def agreeIncomeBasicDeduction : Bool :=
  let totals := [0, 1, 23_499_999, 23_500_000, 23_500_001, 23_999_999,
    24_000_000, 24_000_001, 24_499_999, 24_500_000, 24_500_001,
    24_999_999, 25_000_000, 25_000_001, 25_500_000, 99_999_999]
  let deductions := [0, 1, 160_000, 320_000, 480_000, 580_000, 1_000_000, 25_000_000]
  totals.all fun t =>
    (basicDeductionAmount t == specBasicDeductionAmount t) &&
    deductions.all fun d =>
      (taxableAfterBasicDeduction t d == specTaxableAfterBasicDeduction t d)

example : agreeIncomeBasicDeduction = true := by decide

end JapanTaxLaw.IncomeBasicDeduction
