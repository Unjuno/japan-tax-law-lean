import JapanTaxLaw.RetainedAmountLocalTax

/-!
# RetainedAmountLocalTax spec — 法人税法施行令 art. 139の10

Sources (pinned; identical to RetainedAmountLocalTax.lean):

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01

Independent restatement of:

  * 基本額 = adjusted × 104 / 1000
  * 調整額 = min(donation × 40 / 100, adjustedLocalTax × 20 / 100)
  * 控除後 = 基本額 − 調整額（特定寄附金がある場合のみ、saturating）

impl が `TaxRate.applyFloor` と `Nat.min` / `Option` を使うのに対し、spec は
整数リテラルと入れ子 if / Option match による独立定式で定式化。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw.RetainedAmountLocalTax

open JapanTaxLaw.TaxFinance

/-- Spec: 基本額（独立定式、applyFloor を使わない）。 -/
def specBaseLocalTax (adjusted : Money) : Money :=
  adjusted * 104 / 1000

/-- Spec: 特定寄附金がある場合の調整額（独立定式、Nat.min を使わない）。 -/
def specSpecialDonationAdjustment (donationSum adjustedLocalTax : Money) : Money :=
  let d := donationSum * 40 / 100
  let t := adjustedLocalTax * 20 / 100
  if d ≤ t then d else t

/-- Spec: 控除額（独立定式）。 -/
def specRetainedAmountLocalTax (adjusted adjustedLocalTax : Money)
    (donationSumOpt : Option Money) : Money :=
  match donationSumOpt with
  | none => adjusted * 104 / 1000
  | some ds =>
      adjusted * 104 / 1000 - specSpecialDonationAdjustment ds adjustedLocalTax

-- ==== points (kernel-decided) ====

example : specBaseLocalTax 0 = 0 := by decide
example : specBaseLocalTax 1000 = 104 := by decide
example : specBaseLocalTax 100_000 = 10_400 := by decide
example : specSpecialDonationAdjustment 1000 1000 = 200 := by decide
example : specSpecialDonationAdjustment 1000 10_000 = 400 := by decide
example : specSpecialDonationAdjustment 0 1000 = 0 := by decide
example : specRetainedAmountLocalTax 100_000 1000 (some 1000) = 10_200 := by decide
example : specRetainedAmountLocalTax 1000 1000 (some 1000) = 0 := by decide
example : specRetainedAmountLocalTax 1000 1000 none = 104 := by decide

/-- 基本額の一致（代表格子）。1040/1000 の 10倍過大を検出する点を含む。 -/
def agreeBaseLocalTax : Bool :=
  [0, 1, 999, 1000, 1001, 12345, 100_000, 1_000_000].all fun n =>
    baseLocalTax n == specBaseLocalTax n

/-- 調整額の一致（min の両方・寄附金 0・調整地方税額 0 を含む）。 -/
def agreeSpecialDonationAdjustment : Bool :=
  [ (0, 0), (0, 1000), (1000, 0), (1000, 1000), (1000, 10_000),
    (100, 500), (500, 100), (12345, 6789), (1_000_000, 1) ].all fun (ds, alt) =>
    specialDonationAdjustment ds alt == specSpecialDonationAdjustment ds alt

/-- 控除額の一致（寄附金なし・調整額が基本額を超える saturating を含む）。 -/
def agreeRetainedAmountLocalTax : Bool :=
  [ (1000, 1000, none), (0, 0, none), (100_000, 1000, some 1000),
    (100_000, 10_000, some 1000), (1000, 1000, some 1000),
    (0, 1000, some 1000), (100_000, 0, some 1000), (1, 1, some 0) ].all
    fun (adjusted, alt, opt) =>
      retainedAmountLocalTax adjusted alt opt ==
        specRetainedAmountLocalTax adjusted alt opt

example : agreeBaseLocalTax = true := by decide
example : agreeSpecialDonationAdjustment = true := by decide
example : agreeRetainedAmountLocalTax = true := by decide

end JapanTaxLaw.RetainedAmountLocalTax
