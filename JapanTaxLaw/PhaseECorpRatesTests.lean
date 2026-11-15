import JapanTaxLaw.PhaseECorpRates

/-!
# PhaseECorpRates tests — cross-law rate consistency smoke checks

Decidable smoke tests for the 法人税法 art. 66 ↔ 租税特別措置法 art. 67の2/art. 68
consistency model, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Each `example` covers: the 19% floor under both special provisions, the
¥10億 cap and its month proration, the 22% excess band's composition,
the ineligible fallback, and zero cases.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 租税特別措置法 art. 67の2(1): 承認特定医療法人は百分の十九
example : specialMedicalCorpTax 0 = 0 := by decide
example : specialMedicalCorpTax 1 = 0 := by decide
example : specialMedicalCorpTax 5_000_000_000 = 950_000_000 := by decide
example : specialMedicalCorpTax 8_000_000_000 = 1_520_000_000 := by decide
-- art. 67の2 は art. 66(3) と同じ税率（同一関数）
example : specialMedicalCorpTax 2_000_000_000 = corporateTax .publicInterestOrCoop
    ⟨500_000_000, false, false, false, false, false, false⟩ 2_000_000_000 := by decide

-- 租税特別措置法 art. 68(1): cap ¥10億（12ヶ月事業年度）
example : coopSpecialCap 12 = 1_000_000_000 := by decide
-- 月数換算（art. 68(2) を含む）
example : coopSpecialCap 1 = 83_333_333 := by decide
example : coopSpecialCap 3 = 250_000_000 := by decide
example : coopSpecialCap 6 = 500_000_000 := by decide
example : coopSpecialCap 9 = 750_000_000 := by decide

-- cap 以下: 百分の十九（法人税法 art. 66(3) と同一）
example : coopSpecialTax ⟨true, 12⟩ 500_000_000 = 95_000_000 := by decide
example : coopSpecialTax ⟨true, 12⟩ 1_000_000_000 = 190_000_000 := by decide
-- cap 超過: 百分の十九×cap + 百分の二十二×超過
example : coopSpecialTax ⟨true, 12⟩ 1_500_000_000 = 300_000_000 := by decide
example : coopSpecialTax ⟨true, 12⟩ 2_000_000_000 = 410_000_000 := by decide

-- 適格でない場合: 百分の十九（art. 66(3) fallback）
example : coopSpecialTax ⟨false, 12⟩ 2_000_000_000 = 380_000_000 := by decide
example : coopSpecialTax ⟨false, 6⟩ 700_000_000 = 133_000_000 := by decide

-- 6ヶ月事業年度: cap ¥5億 → 超過 ¥2億は百分の二十二
example : coopSpecialTax ⟨true, 6⟩ 700_000_000 =
    coopSpecialTaxRaw 700_000_000 500_000_000 := by decide
example : coopSpecialTaxRaw 700_000_000 500_000_000 = 139_000_000 := by decide

-- 単調非減少（a ≤ b ⇒ coopSpecialTaxRaw a cap ≤ coopSpecialTaxRaw b cap）: instance
example : coopSpecialTaxRaw 100 500_000_000 ≤ coopSpecialTaxRaw 700_000_000 500_000_000 := by decide

end JapanTaxLaw
