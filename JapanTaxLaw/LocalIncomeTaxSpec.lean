import JapanTaxLaw.LocalIncomeTax

/-!
# LocalIncomeTax spec — independent statement of 地方税法 art. 34(2)/(1)十号/art. 35

Source (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Independent restatement of 地方税法 道府県民税 art. 34(2)（基礎控除）、art. 34(1) 十号
（配偶者控除）、art. 35（所得割の税率）from the statutory text itself. Where the
implementation uses `if` tiers on `totalIncome`, this spec computes the deduction via a
rank-selection on the same thresholds with a different decision shape (`min`-based for
the top band of the spouse table).

Scope boundaries are identical to the implementation (see LocalIncomeTax.lean).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 34(2) 基礎控除 — direct band lookup. -/
def specLocalSpecBasicDeduction (totalIncome : Money) : Money :=
  if totalIncome ≤ 24_000_000 then 430_000
  else if totalIncome ≤ 24_500_000 then 290_000
  else if totalIncome ≤ 25_000_000 then 150_000
  else 0

/-- Spec: art. 34(1) 十号 配偶者控除 — band lookup with the elderly amount as max. -/
def specLocalSpecSpouseDeduction (totalIncome : Money) (spouseIsElderly : Bool) : Money :=
  let base :=
    if totalIncome ≤ 9_000_000 then 330_000
    else if totalIncome ≤ 9_500_000 then 220_000
    else if totalIncome ≤ 10_000_000 then 110_000
    else 0
  if spouseIsElderly then
    if totalIncome ≤ 9_000_000 then max base 380_000
    else if totalIncome ≤ 9_500_000 then max base 260_000
    else if totalIncome ≤ 10_000_000 then max base 130_000
    else base
  else base

/-- Spec: art. 35 標準税率 — 百分の四（指定都市区域内住所者は百分の二）. -/
def specLocalSpecStandardRate (livesInDesignatedCity : Bool) : TaxRate :=
  if livesInDesignatedCity then ⟨2, 100, by decide⟩ else ⟨4, 100, by decide⟩

/-- Spec: art. 35 所得割の額 — applyFloor of the standard rate on the total of the
    three taxable amounts. -/
def specLocalIncomeTaxAmount
    (taxableTotalIncome taxableRetirementIncome taxableForestIncome : Money)
    (livesInDesignatedCity : Bool) : Money :=
  (specLocalSpecStandardRate livesInDesignatedCity).applyFloor
    (taxableTotalIncome + taxableRetirementIncome + taxableForestIncome)

-- ==== points, all kernel-decided ====

-- art. 34(2): each band and each edge ±¥1
example : specLocalSpecBasicDeduction 0 = 430_000 := by decide
example : specLocalSpecBasicDeduction 24_000_000 = 430_000 := by decide
example : specLocalSpecBasicDeduction 24_000_001 = 290_000 := by decide
example : specLocalSpecBasicDeduction 24_500_000 = 290_000 := by decide
example : specLocalSpecBasicDeduction 24_500_001 = 150_000 := by decide
example : specLocalSpecBasicDeduction 25_000_000 = 150_000 := by decide
example : specLocalSpecBasicDeduction 25_000_001 = 0 := by decide
example : specLocalSpecBasicDeduction 100_000_000 = 0 := by decide

-- art. 34(1) 十号: each band and edge ±¥1, regular and elderly
example : specLocalSpecSpouseDeduction 9_000_000 false = 330_000 := by decide
example : specLocalSpecSpouseDeduction 9_000_001 false = 220_000 := by decide
example : specLocalSpecSpouseDeduction 9_500_000 false = 220_000 := by decide
example : specLocalSpecSpouseDeduction 9_500_001 false = 110_000 := by decide
example : specLocalSpecSpouseDeduction 10_000_000 false = 110_000 := by decide
example : specLocalSpecSpouseDeduction 10_000_001 false = 0 := by decide
example : specLocalSpecSpouseDeduction 9_000_000 true = 380_000 := by decide
example : specLocalSpecSpouseDeduction 9_500_000 true = 260_000 := by decide
example : specLocalSpecSpouseDeduction 10_000_000 true = 130_000 := by decide
example : specLocalSpecSpouseDeduction 10_000_001 true = 0 := by decide

-- art. 35: the two standard rates
example : (specLocalSpecStandardRate false).num = 4 ∧ (specLocalSpecStandardRate false).den = 100 := by decide
example : (specLocalSpecStandardRate true).num = 2 ∧ (specLocalSpecStandardRate true).den = 100 := by decide
-- art. 35: 10,000,000 × 4% = 400,000
example : specLocalIncomeTaxAmount 10_000_000 0 0 false = 400_000 := by decide
-- art. 35: 10,000,000 × 2% = 200,000（指定都市）
example : specLocalIncomeTaxAmount 10_000_000 0 0 true = 200_000 := by decide
-- art. 35: mixed bases sum before flat rate: (3M + 2M + 1M) × 4% = 240,000
example : specLocalIncomeTaxAmount 3_000_000 2_000_000 1_000_000 false = 240_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering every band edge and both rate paths.
    Points are sample points, not a proof of universal equivalence. -/
def agreeLocalIncomeTaxPoints : Bool :=
  let incomes := [0, 9_000_000, 9_000_001, 9_500_000, 9_500_001, 10_000_000,
                  10_000_001, 24_000_000, 24_000_001, 24_500_000, 24_500_001,
                  25_000_000, 25_000_001]
  let rec checkAll (xs : List Money) (acc : Bool) : Bool :=
    match xs with
    | [] => acc
    | x :: rest =>
        checkAll rest
          (acc &&
            (basicDeduction x == specLocalSpecBasicDeduction x) &&
            (spouseDeduction x false == specLocalSpecSpouseDeduction x false) &&
            (spouseDeduction x true == specLocalSpecSpouseDeduction x true))
  let a := checkAll incomes true
  let b := localPrefecturalIncomeTaxAmount 3_000_000 2_000_000 1_000_000 false ==
    specLocalIncomeTaxAmount 3_000_000 2_000_000 1_000_000 false
  let c := localPrefecturalIncomeTaxAmount 9_999_999 0 0 true ==
    specLocalIncomeTaxAmount 9_999_999 0 0 true
  let d := localPrefecturalIncomeTaxAmount 0 0 0 false ==
    specLocalIncomeTaxAmount 0 0 0 false
  a && b && c && d

example : agreeLocalIncomeTaxPoints = true := by decide

end JapanTaxLaw
