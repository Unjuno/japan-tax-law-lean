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
def specLocalBasicDeduction (totalIncome : Money) : Money :=
  if totalIncome ≤ 24_000_000 then 430_000
  else if totalIncome ≤ 24_500_000 then 290_000
  else if totalIncome ≤ 25_000_000 then 150_000
  else 0

/-- Spec: art. 34(1) 十号 配偶者控除 — band lookup with the elderly amount as max. -/
def specLocalSpouseDeduction (totalIncome : Money) (spouseIsElderly : Bool) : Money :=
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
def specLocalStandardRate (livesInDesignatedCity : Bool) : TaxRate :=
  if livesInDesignatedCity then ⟨2, 100, by decide⟩ else ⟨4, 100, by decide⟩

/-- Spec: art. 35 所得割の額 — applyFloor of the standard rate on the total of the
    three taxable amounts. -/
def specLocalIncomeTaxAmount
    (taxableTotalIncome taxableRetirementIncome taxableForestIncome : Money)
    (livesInDesignatedCity : Bool) : Money :=
  (specLocalStandardRate livesInDesignatedCity).applyFloor
    (taxableTotalIncome + taxableRetirementIncome + taxableForestIncome)

/-- Spec: art. 34(1)第六号 障害者控除額 — literal fixed amounts. -/
def specDisabilityDeduction (isSpecialDisabled isDependentOrSpouse isCohabiting : Bool) : Money :=
  if isSpecialDisabled && isDependentOrSpouse && isCohabiting then 530_000
  else if isSpecialDisabled then 300_000 else 260_000

def specWidowDeduction : Money := 260_000

def specSingleParentDeduction : Money := 300_000

/-- Spec: art. 34(1)第二号 医療費控除額 — literal form of the statute. -/
def specMedicalExpenseDeduction (totalGeneralIncome medicalExpensesPaid : Money) : Money :=
  let floor := min (totalGeneralIncome * 5 / 100) 100_000
  let excess := if medicalExpensesPaid > floor then medicalExpensesPaid - floor else 0
  min excess 2_000_000

-- ==== points (kernel-decided) ====

example : (specDisabilityDeduction false false false) = 260_000 := by decide
example : (specDisabilityDeduction true false false) = 300_000 := by decide
example : (specDisabilityDeduction true true true) = 530_000 := by decide
example : specWidowDeduction = 260_000 := by decide
example : specSingleParentDeduction = 300_000 := by decide
example : specMedicalExpenseDeduction 100_000_000 300_000 = 200_000 := by decide
example : specMedicalExpenseDeduction 100_000_000 0 = 0 := by decide
example : specMedicalExpenseDeduction 100_000_000 1_000_000 = 900_000 := by decide
example : specMedicalExpenseDeduction 1_000_000 90_000 = 40_000 := by decide
example : specMedicalExpenseDeduction 1_000_000 0 = 0 := by decide
example : specMedicalExpenseDeduction 1_000_000 100_000_000 = 2_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at medical points. -/
def agreeMedicalPoints : Bool :=
  let samples : List (MedicalDeductionFacts) :=
    [ ⟨0, 0⟩, ⟨100_000_000, 0⟩, ⟨100_000_000, 250_001⟩, ⟨100_000_000, 300_000⟩,
      ⟨100_000_000, 1_000_000⟩, ⟨1_000_000, 60_000⟩, ⟨1_000_000, 90_000⟩,
      ⟨1_000_000, 100_000_000⟩ ]
  samples.all fun f =>
    medicalExpenseDeduction f ==
      specMedicalExpenseDeduction f.totalGeneralIncome f.medicalExpensesPaid

example : agreeMedicalPoints = true := by decide

def agreeDisabilityPoints : Bool :=
  [false, true].all fun a =>
    [false, true].all fun b =>
      [false, true].all fun c =>
        disabilityDeduction a b c == specDisabilityDeduction a b c

example : agreeDisabilityPoints = true := by decide

/-- Spec: art. 34(1)十二 の特定親族特別控除額 — anchor-based logic with
    `(x - 841_000) * 2` and the "10万整数倍−8万円" stair-step. -/
def specSpecificDependentDeduction (x : Money) : Money :=
  if x ≤ 950_000 then 450_000
  else if x ≤ 1_150_000 then
    let y := 2 * (x - 841_000)
    let adjusted := y - ((y + 80_000) % 100_000)
    630_000 - adjusted
  else if x ≤ 1_200_000 then 60_000
  else 30_000

-- ==== points (kernel-decided) ====

example : specSpecificDependentDeduction 0 = 450_000 := by decide
example : specSpecificDependentDeduction 950_000 = 450_000 := by decide
example : specSpecificDependentDeduction 950_001 = 510_000 := by decide
example : specSpecificDependentDeduction 1_000_000 = 410_000 := by decide
example : specSpecificDependentDeduction 1_150_000 = 110_000 := by decide
example : specSpecificDependentDeduction 1_150_001 = 60_000 := by decide
example : specSpecificDependentDeduction 1_200_000 = 60_000 := by decide
example : specSpecificDependentDeduction 1_200_001 = 30_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points. -/
def agreeSpecificDependentPoints : Bool :=
  [0, 100_000, 500_000, 950_000, 950_001, 975_000, 1_000_000,
   1_050_000, 1_100_000, 1_150_000, 1_150_001, 1_175_000, 1_200_000,
   1_200_001, 2_000_000].all fun x =>
    specificDependentDeduction x == specSpecificDependentDeduction x

example : agreeSpecificDependentPoints = true := by decide

-- ==== points, all kernel-decided ====

-- art. 34(2): each band and each edge ±¥1
example : specLocalBasicDeduction 0 = 430_000 := by decide
example : specLocalBasicDeduction 24_000_000 = 430_000 := by decide
example : specLocalBasicDeduction 24_000_001 = 290_000 := by decide
example : specLocalBasicDeduction 24_500_000 = 290_000 := by decide
example : specLocalBasicDeduction 24_500_001 = 150_000 := by decide
example : specLocalBasicDeduction 25_000_000 = 150_000 := by decide
example : specLocalBasicDeduction 25_000_001 = 0 := by decide
example : specLocalBasicDeduction 100_000_000 = 0 := by decide

-- art. 34(1) 十号: each band and edge ±¥1, regular and elderly
example : specLocalSpouseDeduction 9_000_000 false = 330_000 := by decide
example : specLocalSpouseDeduction 9_000_001 false = 220_000 := by decide
example : specLocalSpouseDeduction 9_500_000 false = 220_000 := by decide
example : specLocalSpouseDeduction 9_500_001 false = 110_000 := by decide
example : specLocalSpouseDeduction 10_000_000 false = 110_000 := by decide
example : specLocalSpouseDeduction 10_000_001 false = 0 := by decide
example : specLocalSpouseDeduction 9_000_000 true = 380_000 := by decide
example : specLocalSpouseDeduction 9_500_000 true = 260_000 := by decide
example : specLocalSpouseDeduction 10_000_000 true = 130_000 := by decide
example : specLocalSpouseDeduction 10_000_001 true = 0 := by decide

-- art. 35: the two standard rates
example : (specLocalStandardRate false).num = 4 ∧ (specLocalStandardRate false).den = 100 := by decide
example : (specLocalStandardRate true).num = 2 ∧ (specLocalStandardRate true).den = 100 := by decide
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
            (basicDeduction x == specLocalBasicDeduction x) &&
            (spouseDeduction x false == specLocalSpouseDeduction x false) &&
            (spouseDeduction x true == specLocalSpouseDeduction x true))
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
