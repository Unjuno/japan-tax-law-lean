import JapanTaxLaw.SpecialGiftRate

/-!
# SpecialGiftRate tests — 租税特別措置法 art. 70の2の5 smoke checks

Decidable smoke tests for the special lineal-ascendant gift-tax rate table,
pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Each `example` covers an art. 70の2の5(1) boundary or requirement:
the two eligibility gates, the special band edges, equivalence with the general
table below ¥2,000,000, and strict domination above it.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 適格ゲート
example : specialGiftEligible ⟨true, true⟩ = true := by decide
example : specialGiftEligible ⟨true, false⟩ = false := by decide
example : specialGiftEligible ⟨false, true⟩ = false := by decide
example : specialGiftEligible ⟨false, false⟩ = false := by decide

-- 非適格なら相続税法 art. 21-7 の計算にフォールバック
example : specialGiftTax ⟨false, true⟩ 10_000_000 = giftTax 10_000_000 := by decide
example : specialGiftTax ⟨true, false⟩ 10_000_000 = giftTax 10_000_000 := by decide

-- art. 70の2の5(1) 柱書: 600,000円控除後の課税価格
example : specialGiftTax ⟨true, true⟩ 600_000 = 0 := by decide
example : specialGiftTax ⟨true, true⟩ 600_001 = specialGiftPortionTax 1 := by decide

-- 一般表との共通帯（¥2,000,000 までは両表とも 10%）
example : specialGiftPortionTax 2_000_000 = giftPortionTax 2_000_000 := by decide
example : specialGiftPortionTax 1_500_000 = giftPortionTax 1_500_000 := by decide

-- 特別表の刻み（一般表より常に有利）
example : specialGiftPortionTax 3_000_000 = 350_000 := by decide
example : specialGiftPortionTax 4_000_000 = 500_000 := by decide
example : specialGiftPortionTax 6_000_000 = 900_000 := by decide
example : specialGiftPortionTax 10_000_000 = 2_100_000 := by decide
example : specialGiftPortionTax 15_000_000 = 4_100_000 := by decide
example : specialGiftPortionTax 30_000_000 = 10_850_000 := by decide
example : specialGiftPortionTax 45_000_000 = 18_350_000 := by decide

-- 55% トップ帯（両表共通）
example : specialGiftPortionTax 45_000_001 =
    TaxRate.applyFloor ⟨55, 100, by decide⟩ 1 + specialGiftPortionTax 45_000_000 := by decide

-- 支配（特別 <= 一般）：有界サンプル
example : specialGiftPortionTax 100_000_000 < giftPortionTax 100_000_000 := by decide

end JapanTaxLaw
