import JapanTaxLaw.IncomeArt213Withholding

/-!
# IncomeArt213Withholding spec — independent integer restatement of 所得税法 art. 213

Sources (pinned; identical to IncomeArt213Withholding.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This file restates the statutory arithmetic independently in plain `Nat`, without
`TaxRate.applyFloor`: the percentages are written directly as `* 20 / 100` and
`* 10 / 100`, and every deduction is an explicit saturating `if` (rather than
relying on `Nat` subtraction underflow). `agreeArticle213Withholding` checks that
the implementation and this independent restatement coincide at a fixed set of
points (kernel `decide`).

Scope boundaries are identical to the implementation. In particular:

  * the 一号/二号 and イ/ロ/ハ category choices are caller-established Bools;
  * the 一号ハ premium-corresponding amount (政令で定めるところにより計算した金額),
    its eligibility, and the non-cash prize valuation are NOT MODELLED;
  * art. 213 第一項 三号 (15%) and 第二項 are NOT MODELLED.

No claim of completeness or legal correctness is made.
-/

namespace JapanTaxLaw.IncomeArt213Withholding

-- ==== 控除額: 独立定式（impl の 50_000 * months に対して months * 50_000） ====

/-- art. 213 一号イ: 月数 × 五万円。 -/
def specPensionDeduction (months : Nat) : Nat := months * 50_000

/-- art. 213 一号ロ: 五十万円。 -/
def specPrizeDeduction : Nat := 500_000

-- ==== 控除後金額: 明示的な saturating if ====

def specPension12Base (annuity : Nat) (months : Nat) : Nat :=
  if specPensionDeduction months ≤ annuity
    then annuity - specPensionDeduction months
    else 0

def specPrize13Base (prize : Nat) : Nat :=
  if specPrizeDeduction ≤ prize then prize - specPrizeDeduction else 0

def specPension14Base (annuity premiumCorrespondingAmount : Nat) : Nat :=
  if premiumCorrespondingAmount ≤ annuity
    then annuity - premiumCorrespondingAmount
    else 0

-- ==== 一号の区分選択 ====

def specItem1Base (amount months premiumCorrespondingAmount : Nat)
    (isPension12 isPrize13 isPension14 : Bool) : Nat :=
  if isPension12 then specPension12Base amount months
  else if isPrize13 then specPrize13Base amount
  else if isPension14 then specPension14Base amount premiumCorrespondingAmount
  else amount

-- ==== art. 213 第一項の徴収税額（TaxRate.applyFloor を使わない） ====

/-- true = 二号（10%）、false = 一号（20%）。 -/
def specArticle213WithholdingTax (amount months premiumCorrespondingAmount : Nat)
    (isItem2 isPension12 isPrize13 isPension14 : Bool) : Nat :=
  if isItem2 then amount * 10 / 100
  else specItem1Base amount months premiumCorrespondingAmount
         isPension12 isPrize13 isPension14 * 20 / 100

-- ==== points（独立定式のスモーク） ====

example : specPensionDeduction 12 = 600_000 := by decide
example : specPensionDeduction 0 = 0 := by decide
example : specPension12Base 1_000_000 12 = 400_000 := by decide
example : specPension12Base 100_000 3 = 0 := by decide
example : specPrize13Base 1_000_000 = 500_000 := by decide
example : specPrize13Base 400_000 = 0 := by decide
example : specPension14Base 1_000_000 250_000 = 750_000 := by decide
example : specPension14Base 100 200 = 0 := by decide

example : specArticle213WithholdingTax 1_000_000 12 0 false true false false = 80_000 := by decide
example : specArticle213WithholdingTax 1_000_000 0 0 false false true false = 100_000 := by decide
example : specArticle213WithholdingTax 1_000_000 0 250_000 false false false true = 150_000 := by decide
example : specArticle213WithholdingTax 1_000_000 0 0 true false false false = 100_000 := by decide
example : specArticle213WithholdingTax 0 0 0 false false false false = 0 := by decide

-- ==== agreement（impl ↔ spec、全項目を == で比較） ====

/-- 実装と独立定式が全テスト点で一致するか（列挙された有限点のみ；全称主張ではない）。 -/
def agreeArticle213Withholding : Bool :=
  let triples := [(0, 0, 0), (100_000, 3, 0), (400_000, 0, 0),
                  (1_000_000, 0, 0), (1_000_000, 12, 0),
                  (1_000_000, 0, 250_000), (100, 0, 200),
                  (100, 1, 100), (9, 0, 0), (12_345_678, 7, 13)]
  let flags : List (Bool × Bool × Bool × Bool) :=
    [(false, false, false, false), (false, true, false, false),
     (false, false, true, false), (false, false, false, true),
     (true, false, false, false), (true, true, true, true)]
  triples.all fun t =>
    flags.all fun f =>
      article213WithholdingTax t.1 t.2.1 t.2.2 f.1 f.2.1 f.2.2.1 f.2.2.2 ==
        specArticle213WithholdingTax t.1 t.2.1 t.2.2 f.1 f.2.1 f.2.2.1 f.2.2.2

example : agreeArticle213Withholding = true := by decide

end JapanTaxLaw.IncomeArt213Withholding
