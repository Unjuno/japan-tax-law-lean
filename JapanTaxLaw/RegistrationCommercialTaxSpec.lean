import JapanTaxLaw.RegistrationCommercialTax

/-!
# RegistrationCommercialTax spec — independent statement of 登録免許税法 別表第一（二）第二十四号（一）イ

Source (pinned):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15

Independent restatement of 登録免許税法 別表第一（二）第二十四号（一）イ
（株式会社の設立の登記: 資本金の額 × 千分の七、ただし税額が ¥150,000 に満たないときは
申請件数一件につき ¥150,000） from the statutory text itself.

Scope boundaries are identical to the implementation (see RegistrationCommercialTax.lean).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 別表第一（二）第二十四号（一）イ — 株式会
    資本金の額 × 千分の七（floor(capital × 7 / 1000)）、但し最低 ¥150,000/件. -/
def specStockFormationTax (f : CommercialFormationFacts) : Money :=
  if f.isStockCompanyFormation && f.isNotNewMergerSubdivision then
    let computed := (f.capital * 7) / 1000
    max 150_000 computed
  else 0

-- ==== points, all kernel-decided ====

example : specStockFormationTax ⟨true, true, 0⟩ = 150_000 := by decide
example : specStockFormationTax ⟨true, true, 21_428_571⟩ = 150_000 := by decide
example : specStockFormationTax ⟨true, true, 25_000_000⟩ = 175_000 := by decide
example : specStockFormationTax ⟨true, true, 100_000_000⟩ = 700_000 := by decide
-- (works when capital × 7/1000 exactly hits 150,000 boundary)
example : specStockFormationTax ⟨true, true, 21_428_572⟩ = 150_000 := by decide
-- 除外規定: 新設合併・組織変更・種類の変更・新設分割
example : specStockFormationTax ⟨true, false, 100_000_000⟩ = 0 := by decide
-- 株式会社の設立でない
example : specStockFormationTax ⟨false, true, 100_000_000⟩ = 0 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points. -/
def agreeStockFormationPoints : Bool :=
  let samples :=
    [ ⟨true, true, 0⟩,
      ⟨true, true, 1_000_000⟩,
      ⟨true, true, 10_000_000⟩,
      ⟨true, true, 21_428_571⟩,
      ⟨true, true, 21_428_575⟩,
      ⟨true, true, 25_000_000⟩,
      ⟨true, true, 100_000_000⟩,
      ⟨true, false, 100_000_000⟩,
      ⟨false, true, 100_000_000⟩ ]
  samples.all fun f => stockFormationTax f == specStockFormationTax f

example : agreeStockFormationPoints = true := by decide

end JapanTaxLaw
