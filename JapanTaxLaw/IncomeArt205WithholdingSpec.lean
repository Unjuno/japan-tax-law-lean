import JapanTaxLaw.IncomeArt205Withholding

/-!
# IncomeArt205Withholding spec — independent integer restatement of 所得税法 art. 205

Sources (pinned; identical to IncomeArt205Withholding.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This file restates the statutory arithmetic independently in plain `Nat`, without
`TaxRate.applyFloor` and without `min`: the percentages are written directly as
`* 10 / 100` and `* 20 / 100`, and every cap / subtraction is an explicit
saturating `if`. `agreeArt205Tax` / `agreeArt205TaxAfterDeduction` check that the
implementation and the independent restatement coincide at a fixed finite set of
points (kernel `decide`).

Scope boundaries are identical to the implementation: the 一号/二号 category
choice is caller-established (no Bool enters an amount formula), and the
政令で定める控除額 and non-cash prize valuation are NOT MODELLED.

No claim of completeness or legal correctness is made.
-/

namespace JapanTaxLaw.IncomeArt205Withholding

-- ==== 一号: 独立定式（impl の min / Nat 減算に対して明示的な if） ====

/-- 10% をかける基数: min(amount, 1_000_000) の独立定式。 -/
def specCappedBase (amount : Nat) : Nat :=
  if amount ≤ 1_000_000 then amount else 1_000_000

/-- 20% をかける基数: amount − 1_000_000（saturating）の独立定式。 -/
def specExcessBase (amount : Nat) : Nat :=
  if 1_000_000 ≤ amount then amount - 1_000_000 else 0

/-- art. 205 一号の徴収税額（率を直接整数で書き下す）。 -/
def specArt205Tax (amount : Nat) : Nat :=
  specCappedBase amount * 10 / 100 + specExcessBase amount * 20 / 100

-- ==== 二号: 独立定式 ====

/-- 控除後金額: amount − deduction（saturating）の独立定式。 -/
def specAfterDeductionBase (amount deduction : Nat) : Nat :=
  if deduction ≤ amount then amount - deduction else 0

/-- art. 205 二号の徴収税額。 -/
def specArt205TaxAfterDeduction (amount deduction : Nat) : Nat :=
  specAfterDeductionBase amount deduction * 10 / 100

-- ==== points（独立定式のスモーク） ====

example : specCappedBase 999_999 = 999_999 := by decide
example : specCappedBase 1_000_000 = 1_000_000 := by decide
example : specCappedBase 1_000_001 = 1_000_000 := by decide
example : specExcessBase 999_999 = 0 := by decide
example : specExcessBase 1_000_000 = 0 := by decide
example : specExcessBase 1_000_001 = 1 := by decide
example : specArt205Tax 1_000_000 = 100_000 := by decide
example : specArt205Tax 1_000_005 = 100_001 := by decide
example : specAfterDeductionBase 100 200 = 0 := by decide
example : specArt205TaxAfterDeduction 1_000_000 200_000 = 80_000 := by decide

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 一号: 実装と独立定式が列挙された有限点で一致するか。 -/
def agreeArt205Tax : Bool :=
  let amounts := [0, 1, 9, 10, 99, 100, 999_999, 1_000_000, 1_000_001,
                  1_000_005, 1_000_100, 1_100_000, 1_234_567, 2_000_000, 12_345_678]
  amounts.all fun a => art205Tax a == specArt205Tax a

/-- 二号: 実装と独立定式が列挙された有限点で一致するか。 -/
def agreeArt205TaxAfterDeduction : Bool :=
  let pairs := [(0, 0), (9, 0), (100, 50), (100, 200), (500_000, 0),
                (1_000_000, 0), (1_000_000, 200_000), (1_000_000, 1_000_001),
                (12_345_678, 13)]
  pairs.all fun p => art205TaxAfterDeduction p.1 p.2 == specArt205TaxAfterDeduction p.1 p.2

example : agreeArt205Tax = true := by decide
example : agreeArt205TaxAfterDeduction = true := by decide

end JapanTaxLaw.IncomeArt205Withholding
