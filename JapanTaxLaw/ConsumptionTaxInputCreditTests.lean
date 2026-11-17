import JapanTaxLaw.ConsumptionTaxInputCredit

/-!
# ConsumptionTaxInputCredit tests — 消費税法 art. 30(1) smoke checks

Decidable smoke tests, pinned to
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 30(1): 特定課税仕入れ税額 = 支払対価 × 7.8%（切り捨て）
example : specifiedPurchaseTax 100_000 = 7_800 := by decide
example : specifiedPurchaseTax 1 = 0 := by decide
example : specifiedPurchaseTax 0 = 0 := by decide
example : specifiedPurchaseTax 1_000_000 = 78_000 := by decide

-- 合計: domestic + specified + import
example : totalInputTax 20_000 12_000 100_000 = 39_800 := by decide
example : totalInputTax 0 0 0 = 0 := by decide

-- 控除後: output - 合計（input ≤ output のとき正確）
example : taxAfterCredit 100_000 20_000 100_000 12_000 = 60_200 := by decide
example : taxAfterCredit 500_000 50_000 200_000 30_000 = 404_400 := by decide
-- underflow: output < input → 0（還付は射程外、doc-comment 参照）
example : taxAfterCredit 10_000 20_000 100_000 12_000 = 0 := by decide
example : taxAfterCredit 0 0 0 0 = 0 := by decide


-- art. 30(2): 按分ゲート
example : Apportionment.needsApportionment 100_000_000 ⟨95, 100, by decide⟩ = false := by decide
example : Apportionment.needsApportionment 500_000_001 ⟨95, 100, by decide⟩ = true := by decide
example : Apportionment.needsApportionment 100_000_000 ⟨90, 100, by decide⟩ = true := by decide
-- art. 30(2)一: 区分明らか
example : Apportionment.apportionedIfSeparated 100_000 200_000 ⟨95, 100, by decide⟩ = 290_000 := by decide
-- art. 30(2)二: 区分不明
example : Apportionment.apportionedIfUnseparated 300_000 ⟨90, 100, by decide⟩ = 270_000 := by decide

end JapanTaxLaw
