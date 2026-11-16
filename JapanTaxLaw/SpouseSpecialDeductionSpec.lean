import JapanTaxLaw.SpouseSpecialDeduction

/-!
# SpouseSpecialDeduction spec — independent restatement of
  地方税法 art. 34(1)第十号の二（配偶者特別控除）

Sources (pinned; identical to SpouseSpecialDeduction.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Independent restatement of:
  * art. 34(1)第十号の二 — base ladder
      (1) spouse ≤ ¥1,000,000 → ¥330,000
      (2) ¥1,000,000 < spouse ≤ ¥1,300,000 → ¥380,000 − taper(spouse − ¥931,000)
      (3) spouse > ¥1,300,000 → ¥30,000
    where taper(e) = largest k×¥50,000 − ¥30,000 not exceeding e (k ∈ Nat, k=0 ⇒ 0)
  * taxpayer income modifiers
      ≤ ¥9,000,000 → base
      ¥9,000,000 < tp ≤ ¥9,500,000 → roundUp¥10,000 (base × 2/3)
      ¥9,500,000 < tp ≤ ¥10,000,000 → roundUp¥10,000 (base / 3)
    take effect only when the spouse is not a 控除対象配偶者 and the taxpayer income
    is at or below ¥10,000,000 (elsewhere ineligible).
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 34(1)第十号の二 taper（¥50,000 整数倍 − ¥30,000 の切り下げ）。 -/
def specTaper (excess : Money) : Money :=
  let k := (excess + 30_000) / 50_000
  if k = 0 then 0 else k * 50_000 - 30_000

/-- Spec: art. 34(1)第十号の二 base ladder（taxpayer 所得 ¥9,000,000 以下の場合）。 -/
def specBase (spouseTotalIncome : Money) : Money :=
  if spouseTotalIncome ≤ 1_000_000 then 330_000
  else if spouseTotalIncome ≤ 1_300_000 then 380_000 - specTaper (spouseTotalIncome - 931_000)
  else 30_000

/-- Spec: ¥10,000 単位切り上げ。 -/
def specRoundUpToTenThousand (n : Money) : Money := (n + 9_999) / 10_000 * 10_000

/-- Spec: art. 34(1)第十号の二 本体（適格条件は implementation と同一の caller-established）。 -/
def specSpouseSpecialDeduction (taxpayerTotalIncome spouseTotalIncome : Money)
    (isNotQualifyingSpouse : Bool) (ineligible : Bool) : Money :=
  if ineligible then 0
  else if !isNotQualifyingSpouse then 0
  else if spouseTotalIncome > 1_330_000 then 0
  else if taxpayerTotalIncome > 10_000_000 then 0
  else
    let base := specBase spouseTotalIncome
    if taxpayerTotalIncome ≤ 9_000_000 then base
    else if taxpayerTotalIncome ≤ 9_500_000 then specRoundUpToTenThousand (base * 2 / 3)
    else specRoundUpToTenThousand (base / 3)

-- ==== points (kernel-decided) ====

example : specTaper 0 = 0 := by decide
example : specTaper 19_999 = 0 := by decide
example : specTaper 20_000 = 20_000 := by decide
example : specTaper 69_001 = 20_000 := by decide
example : specTaper 119_000 = 70_000 := by decide

example : specBase 500_000 = 330_000 := by decide
example : specBase 1_000_000 = 330_000 := by decide
example : specBase 1_000_001 = 360_000 := by decide
example : specBase 1_100_000 = 260_000 := by decide
example : specBase 1_200_000 = 160_000 := by decide
example : specBase 1_300_000 = 60_000 := by decide
example : specBase 1_300_001 = 30_000 := by decide

example : specSpouseSpecialDeduction 9_000_000 500_000 true false = 330_000 := by decide
example : specSpouseSpecialDeduction 9_000_000 1_000_001 true false = 360_000 := by decide
example : specSpouseSpecialDeduction 9_250_000 500_000 true false = 220_000 := by decide
example : specSpouseSpecialDeduction 9_250_000 1_000_001 true false = 240_000 := by decide
example : specSpouseSpecialDeduction 9_750_000 500_000 true false = 110_000 := by decide
example : specSpouseSpecialDeduction 9_750_000 1_000_001 true false = 120_000 := by decide
example : specSpouseSpecialDeduction 9_750_000 1_100_000 true false = 90_000 := by decide
example : specSpouseSpecialDeduction 10_000_001 500_000 true false = 0 := by decide
example : specSpouseSpecialDeduction 9_000_000 500_000 false false = 0 := by decide
example : specSpouseSpecialDeduction 9_000_000 500_000 true true = 0 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeSpouseSpecialPoints : Bool :=
  [ (0, 500_000, true, false), (9_000_000, 500_000, true, false),
    (9_000_000, 1_000_001, true, false), (9_000_000, 1_100_000, true, false),
    (9_000_000, 1_200_000, true, false), (9_000_000, 1_300_000, true, false),
    (9_000_000, 1_300_001, true, false), (9_000_000, 1_330_001, true, false),
    (9_250_000, 1_000_001, true, false), (9_500_000, 1_000_001, true, false),
    (9_500_001, 500_000, true, false), (10_000_000, 500_000, true, false),
    (10_000_001, 500_000, true, false) ].all fun (tp, sp, ok, excl) =>
    spouseSpecialDeduction ⟨tp, sp, ok, excl⟩ ==
      specSpouseSpecialDeduction tp sp ok excl

example : agreeSpouseSpecialPoints = true := by decide

end JapanTaxLaw
