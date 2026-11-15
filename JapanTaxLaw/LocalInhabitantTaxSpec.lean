import JapanTaxLaw.LocalInhabitantTax

/-!
# LocalInhabitantTax spec — independent statement of 地方税法 art. 314の3

Source (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Independent restatement of 地方税法 art. 314の3（市町村民税所得割の税率 —
百分の六（指定都市の区域内住所者は百分の八）の標準税率を乗じて得た金額）
from the statutory text itself.

Scope boundaries are identical to the implementation (see LocalInhabitantTax.lean).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 314の3 の標準税率 — 百分の六（指定都市）. -/
def specLocalInhabitantStandardRate (livesInDesignatedCity : Bool) : TaxRate :=
  if livesInDesignatedCity then ⟨8, 100, by decide⟩ else ⟨6, 100, by decide⟩

/-- Spec: art. 314の3 所得割の額 — 同上② 前項の「課税総所得金額」等は呼出元入力. -/
def specLocalInhabitantIncomeTaxAmount
    (taxableTotalIncome taxableRetirementIncome taxableForestIncome : Money)
    (livesInDesignatedCity : Bool) : Money :=
  (specLocalInhabitantStandardRate livesInDesignatedCity).applyFloor
    (taxableTotalIncome + taxableRetirementIncome + taxableForestIncome)

-- ==== points, all kernel-decided ====

-- art. 314の3: 標準税率
example : (specLocalInhabitantStandardRate false).num = 6 := by decide
example : (specLocalInhabitantStandardRate false).den = 100 := by decide
example : (specLocalInhabitantStandardRate true).num = 8 := by decide
example : (specLocalInhabitantStandardRate true).den = 100 := by decide

-- art. 314の3: 課税総所得金額 10,000,000 → 6% = 600,000 （指定都市なら 8% = 800,000）
example : specLocalInhabitantIncomeTaxAmount 10_000_000 0 0 false = 600_000 := by decide
example : specLocalInhabitantIncomeTaxAmount 10_000_000 0 0 true = 800_000 := by decide

-- art. 314の3: 課税総所得金額+退職+山林 の合計で課税
example : specLocalInhabitantIncomeTaxAmount 3_000_000 2_000_000 1_000_000 false = 360_000 := by decide
example : specLocalInhabitantIncomeTaxAmount 3_000_000 2_000_000 1_000_000 true = 480_000 := by decide

-- art. 314の3: 0 is 0
example : specLocalInhabitantIncomeTaxAmount 0 0 0 false = 0 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering both tax rates and the mixed-base sum. Points are sample points, not a
    proof of universal equivalence. -/
def _checkLocalInhabitantTaxPoint (x : Money) : Bool :=
  (localInhabitantIncomeTaxAmount x 0 0 false == specLocalInhabitantIncomeTaxAmount x 0 0 false) &&
  (localInhabitantIncomeTaxAmount x 0 0 true == specLocalInhabitantIncomeTaxAmount x 0 0 true) &&
  (localInhabitantIncomeTaxAmount x 500_000 250_000 false == specLocalInhabitantIncomeTaxAmount x 500_000 250_000 false) &&
  (localInhabitantIncomeTaxAmount x 500_000 250_000 true == specLocalInhabitantIncomeTaxAmount x 500_000 250_000 true)

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering both tax rates and the mixed-base sum. Points are sample points, not a
    proof of universal equivalence. -/
def agreeLocalInhabitantTaxPoints : Bool :=
  let incomes := [0, 1, 100_000, 1_000_000, 5_000_000, 9_999_999, 10_000_000,
                  24_000_000, 24_500_000, 25_000_001]
  incomes.all _checkLocalInhabitantTaxPoint

example : agreeLocalInhabitantTaxPoints = true := by decide

end JapanTaxLaw
