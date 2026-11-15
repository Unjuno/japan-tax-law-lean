import JapanTaxLaw.ResidentialTransferSpecialTax

/-!
# ResidentialTransferSpecialTax tests — art. 31の3 smoke checks

Decidable smoke tests for the special residential-property transfer rate, pinned to
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Each example covers a boundary, a paragraph requirement, or the general-regime fallback.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 柱書要件: 適格なら課税長期譲渡所得金額の百分の十（¥60,000,000 以下の場合）
example : residentialGainTax ⟨true, true, true, true⟩ 0 = 0 := by decide
example : residentialGainTax ⟨true, true, true, true⟩ 30_000_000 = 3_000_000 := by decide
example : residentialGainTax ⟨true, true, true, true⟩ 60_000_000 = 6_000_000 := by decide
-- ¥60,000,000 を 1 円超えた場合は ¥6,000,000 のまま（連続）
example : residentialGainTax ⟨true, true, true, true⟩ 60_000_001 = 6_000_000 := by decide
-- 超過分は百分の十五
example : residentialGainTax ⟨true, true, true, true⟩ 60_000_100 = 6_000_015 := by decide
example : residentialGainTax ⟨true, true, true, true⟩ 100_000_000 = 12_000_000 := by decide
example : residentialGainTax ⟨true, true, true, true⟩ 200_000_000 = 27_000_000 := by decide

-- 適格ゲート（externally established booleans）
example : residentialTransferEligible ⟨true, true, true, true⟩ = true := by decide
example : residentialTransferEligible ⟨false, true, true, true⟩ = false := by decide
example : residentialTransferEligible ⟨true, false, true, true⟩ = false := by decide
example : residentialTransferEligible ⟨true, true, false, true⟩ = false := by decide
example : residentialTransferEligible ⟨true, true, true, false⟩ = false := by decide

-- 非適格なら art. 31(1) 一般税率（百分の十五）
example : residentialGainTax ⟨false, true, true, true⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, false, true, true⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, true, false, true⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, true, true, false⟩ 100_000_000 = 15_000_000 := by decide

-- art. 31の3 では ¥60,000,000 以下では一般より必ず有利
example : residentialGainTax ⟨true, true, true, true⟩ 50_000_000 <
    TaxRate.applyFloor longTermGainRate 50_000_000 := by decide

end JapanTaxLaw
