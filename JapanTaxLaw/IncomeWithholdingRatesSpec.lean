import JapanTaxLaw.IncomeWithholdingRates

/-!
# IncomeWithholdingRates spec — independent integer restatement of
    所得税法 art. 208 / 175 / 179

Sources (pinned; identical to IncomeWithholdingRates.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This file restates the statutory arithmetic independently in plain `Nat`, without
`TaxRate.applyFloor`: the percentages are written directly as `* 20 / 100` etc.,
and the art. 208 deduction is an explicit `if` (rather than relying on Nat
subtraction underflow). `agreeIncomeWithholdingRates` checks that the implementation
and this independent restatement coincide at a fixed set of points (kernel `decide`).

Scope boundaries are identical to the implementation. In particular the eligibility
facts / category choices (年金に対応する保険料対応額、利子等／配当等、国内源泉所得の
一号／二号／三号) are caller-established and are never used to derive an amount
inside this model. art. 175 第三号（賞金）and the art. 179 第百六十九条 base
readjustments are NOT MODELLED.
-/

namespace JapanTaxLaw.IncomeWithholdingRates

open JapanTaxLaw.TaxFinance

-- ==== art. 208: 独立定式（saturating 控除 + 10%） ====

/-- 控除後年金 = 年金 − 保険料対応額、ただし年金が保険料対応額未満なら 0。 -/
def specArticle208DeductedAnnuity (annuityAmount premiumCorrespondingAmount : Nat) : Nat :=
  if premiumCorrespondingAmount ≤ annuityAmount
    then annuityAmount - premiumCorrespondingAmount
    else 0

/-- art. 208: 徴収税額 = 控除後年金 × 10 / 100。 -/
def specArticle208WithholdingTax (annuityAmount premiumCorrespondingAmount : Nat) : Nat :=
  specArticle208DeductedAnnuity annuityAmount premiumCorrespondingAmount * 10 / 100

-- ==== art. 175: 独立定式（TaxRate.applyFloor を使わない） ====

/-- art. 175: 配当等 20%、利子等 15%。 -/
def specArticle175WithholdingTax (isDividend : Bool) (amount : Nat) : Nat :=
  if isDividend then amount * 20 / 100 else amount * 15 / 100

-- ==== art. 179: 独立定式（TaxRate.applyFloor を使わない） ====

/-- art. 179: 一号 20%、二号 10%、三号 15%。 -/
def specArticle179WithholdingTax (category : ForeignCorpDomesticSourceCategory)
    (amount : Nat) : Nat :=
  match category with
  | .general => amount * 20 / 100
  | .item5 => amount * 10 / 100
  | .item8Or15 => amount * 15 / 100

-- ==== points（独立定式のスモーク） ====

example : specArticle208DeductedAnnuity 1_000_000 250_000 = 750_000 := by decide
example : specArticle208DeductedAnnuity 100 101 = 0 := by decide
example : specArticle208WithholdingTax 1_000_000 250_000 = 75_000 := by decide
example : specArticle208WithholdingTax 1_000 1_100 = 0 := by decide

example : specArticle175WithholdingTax true 1_000_000 = 200_000 := by decide
example : specArticle175WithholdingTax false 1_000_000 = 150_000 := by decide

example : specArticle179WithholdingTax .general 1_000_000 = 200_000 := by decide
example : specArticle179WithholdingTax .item5 1_000_000 = 100_000 := by decide
example : specArticle179WithholdingTax .item8Or15 1_000_000 = 150_000 := by decide

-- ==== agreement（impl ↔ spec、全項目を == で比較） ====

/-- 実装と独立定式が全テスト点で一致するか（列挙された有限点のみ；全称主張ではない）。 -/
def agreeIncomeWithholdingRates : Bool :=
  let pairs := [(0, 0), (100, 0), (100, 100), (100, 101), (1000, 200),
                (1000, 1200), (1_000_000, 250_000), (12_345_678, 7)]
  let amounts := [0, 1, 3, 5, 7, 9, 99, 100, 101, 1_000, 1_000_000, 12_345_678]
  (pairs.all fun p =>
      article208WithholdingTax p.1 p.2 == specArticle208WithholdingTax p.1 p.2) &&
  (amounts.all fun m =>
      article175WithholdingTax true m == specArticle175WithholdingTax true m &&
      article175WithholdingTax false m == specArticle175WithholdingTax false m &&
      article179WithholdingTax .general m == specArticle179WithholdingTax .general m &&
      article179WithholdingTax .item5 m == specArticle179WithholdingTax .item5 m &&
      article179WithholdingTax .item8Or15 m == specArticle179WithholdingTax .item8Or15 m)

example : agreeIncomeWithholdingRates = true := by decide

end JapanTaxLaw.IncomeWithholdingRates
