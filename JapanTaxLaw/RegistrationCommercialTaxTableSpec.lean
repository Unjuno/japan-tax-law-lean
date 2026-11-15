import JapanTaxLaw.RegistrationCommercialTaxTable

/-!
# RegistrationCommercialTaxTable spec — independent restatement of
  登録免許税法 別表第一（二）第二十四号（一）ロ〜チ

Sources (pinned; identical to RegistrationCommercialTaxTable.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * ロ　合名会社若しくは合資会社又は一般社団法人等の設立の登記の税額（申請件数一件につき六万円）;
  * ハ　合同会社の設立の登記（ホ及びトに掲げる登記を除く。）の税額
    （資本金の額千分の七、計算税額が六万円に満たないときは申請件数一件につき六万円）;
  * ニ　株式会社又は合同会社の資本金の増加の登記（ヘ及びチに掲げる登記を除く。）の税額
    （増加した資本金の額千分の七、計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * ホ　新設合併又は組織変更若しくは種類の変更による株式会社又は合同会社の設立の登記の税額
    （資本金の額千分の一・五、直前における資本金の額を超える部分は千分の七、
     計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * ヘ　吸収合併による株式会社又は合同会社の資本金の増加の登記の税額
    （増加した資本金の額千分の一・五、直前における資本金の額を超える部分は千分の七、
     計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * ト　新設分割による株式会社又は合同会社の設立の登記の税額
    （資本金の額千分の七、計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * チ　吸収分割による株式会社又は合同会社の資本金の増加の登記の税額
    （増加した資本金の額千分の七、計算税額が三万円に満たないときは申請件数一件につき三万円）
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: ロ — 申請件数一件につき六万円、固定額。 -/
def specGmporGeneralFormationTax : Money := 60_000

/-- Spec: ハ — 資本金の額 × 千分の七、floor が六万円未満なら六万円。 -/
def specGoudoushaFormationTax (capital : Money) : Money :=
  max (capital * 7 / 1000) 60_000

/-- Spec: ニ — 増加した資本金の額 × 千分の七、floor が三万円未満なら三万円。 -/
def specCapitalIncreaseTax (increase : Money) : Money :=
  max (increase * 7 / 1000) 30_000

/-- Spec: ト — 資本金の額 × 千分の七、floor が三万円未満なら三万円。 -/
def specNewDivisionalFormationTax (capital : Money) : Money :=
  max (capital * 7 / 1000) 30_000

/-- Spec: チ — 増加した資本金の額 × 千分の七、floor が三万円未満なら三万円。 -/
def specAbsorptionDivisionIncreaseTax (increase : Money) : Money :=
  max (increase * 7 / 1000) 30_000

/-- Spec: ホ/ヘ共通 — 千分の一・五の部分と、直前資本金を超える部分の千分の七の部分の合計。 -/
def specMergedPortionTax (amount preMergerCapitalBasis : Money) : Money :=
  let portion1 := min amount preMergerCapitalBasis
  let portion2 := amount - portion1
  portion1 * 15 / 10000 + portion2 * 7 / 1000

/-- Spec: ホ — 新設合併 etc. -/
def specNewMergerFormationTax (capital preMergerCapitalBasis : Money) : Money :=
  max (specMergedPortionTax capital preMergerCapitalBasis) 30_000

/-- Spec: ヘ — 吸収合併による資本金の増加の登記。 -/
def specAbsorptionMergerIncreaseTax (increase preMergerCapitalBasis : Money) : Money :=
  max (specMergedPortionTax increase preMergerCapitalBasis) 30_000

-- ==== points, all kernel-decided ====

example : specGmporGeneralFormationTax = 60_000 := by decide
example : specGoudoushaFormationTax 0 = 60_000 := by decide
example : specGoudoushaFormationTax 10_000_000_000 = 70_000_000 := by decide
example : specCapitalIncreaseTax 0 = 30_000 := by decide
example : specCapitalIncreaseTax 4_000_000_000 = 28_000_000 := by decide
example : specNewDivisionalFormationTax 0 = 30_000 := by decide
example : specNewDivisionalFormationTax 10_000_000_000 = 70_000_000 := by decide
example : specAbsorptionDivisionIncreaseTax 0 = 30_000 := by decide
example : specAbsorptionDivisionIncreaseTax 10_000_000_000 = 70_000_000 := by decide
example : specNewMergerFormationTax 0 0 = 30_000 := by decide
example : specNewMergerFormationTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide
example : specNewMergerFormationTax 5_000_000_000 5_000_000_000 = 7_500_000 := by decide
example : specNewMergerFormationTax 7_000_000_000 5_000_000_000 = 7_500_000 + 14_000_000 := by decide
example : specAbsorptionMergerIncreaseTax 0 0 = 30_000 := by decide
example : specAbsorptionMergerIncreaseTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points. -/
def agreeCommercialItemPoints : Bool :=
  [0, 1_000_000_000, 2_000_000_000, 4_999_999, 5_000_000_000, 10_000_000_000].all fun x =>
    goudoushaFormationTax x == specGoudoushaFormationTax x &&
      capitalIncreaseTax x == specCapitalIncreaseTax x &&
      newDivisionalFormationTax x == specNewDivisionalFormationTax x &&
      absorptionDivisionIncreaseTax x == specAbsorptionDivisionIncreaseTax x

def agreeMergedPoints : Bool :=
  [(0, 0), (2_000_000_000, 5_000_000_000), (5_000_000_000, 5_000_000_000),
   (7_000_000_000, 5_000_000_000), (10_000_000_000, 10_000_000_000),
   (3_000_000_000, 1_000_000_000)].all fun (a, b) =>
    newMergerFormationTax a b == specNewMergerFormationTax a b &&
      absorptionMergerIncreaseTax a b == specAbsorptionMergerIncreaseTax a b

example : agreeCommercialItemPoints = true := by decide
example : agreeMergedPoints = true := by decide

end JapanTaxLaw
