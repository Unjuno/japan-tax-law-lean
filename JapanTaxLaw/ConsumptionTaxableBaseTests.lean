import JapanTaxLaw.ConsumptionTaxableBase

/-!
# ConsumptionTaxableBase tests — 消費税法 art. 28 smoke checks

Decidable smoke tests for the 消費税法 art. 28 model, pinned to
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Covers: normal (regular) transfers, the ただし書 (proviso) applying, the proviso
not applying, the flag truth table (both flags / ロ flags), and zero amounts.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 正常例: ordinary transfer — consideration is the base
example : taxableTransferBase ⟨100_000, false, false, 1_000_000⟩ = 100_000 := by decide
example : taxableTransferBase ⟨250_000, false, false, 10⟩ = 250_000 := by decide

-- ただし書適用: officer transfer + markedly low → asset value
example : taxableTransferBase ⟨100_000, true, true, 1_000_000⟩ = 1_000_000 := by decide
example : taxableTransferBase ⟨123, true, true, 9_999⟩ = 9_999 := by decide

-- 非適用: officer but NOT markedly low → consideration
example : taxableTransferBase ⟨100_000, true, false, 1_000_000⟩ = 100_000 := by decide
-- 非適用: markedly low but NOT an officer transfer → consideration
example : taxableTransferBase ⟨100_000, false, true, 1_000_000⟩ = 100_000 := by decide

-- ロ flags（両フラグ true）: the only combination that switches the base
example : taxableTransferBase ⟨1, true, true, 2⟩ = 2 := by decide

-- 金額0: zero consideration / zero asset value
example : taxableTransferBase ⟨0, false, false, 0⟩ = 0 := by decide
example : taxableTransferBase ⟨0, true, true, 0⟩ = 0 := by decide
example : taxableTransferBase ⟨0, true, false, 500⟩ = 0 := by decide
example : specifiedPurchaseBase 0 = 0 := by decide
example : deemedSupplyBase DeemedSupplyAct.consumptionOrUse 0 = 0 := by decide
example : deemedSupplyBase DeemedSupplyAct.gift 0 = 0 := by decide

-- art. 28(2): specified purchase — paid consideration is the base
example : specifiedPurchaseBase 50_000 = 50_000 := by decide
example : specifiedPurchaseBase 1_000_000 = 1_000_000 := by decide

-- art. 28(3) 一号・二号: deemed supply — asset value is the base
example : deemedSupplyBase DeemedSupplyAct.consumptionOrUse 300_000 = 300_000 := by decide
example : deemedSupplyBase DeemedSupplyAct.gift 300_000 = 300_000 := by decide

end JapanTaxLaw
