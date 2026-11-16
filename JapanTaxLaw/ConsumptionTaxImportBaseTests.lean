import JapanTaxLaw.ConsumptionTaxImportBase

/-!
# ConsumptionTaxImportBase tests — 消費税法 art. 28(4) smoke checks

Decidable smoke tests for the 消費税法 art. 28(4) model, pinned to
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Covers: the worked conversion example (10,000,000 + 200,000 + 300,000 =
10,500,000), invariance under the applicability gate flag, zero amounts,
and one-field-only variations. Only `decide` examples; no new theorem names.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 換算例: 関税定率法に準じた価格 10,000,000 + 消費税以外の消費税等 200,000 + 関税 300,000
example : importTaxableBase ⟨true, 10_000_000, 200_000, 300_000⟩ = 10_500_000 := by decide

-- ゲートは式に入らない（false でも同じ金額）
example : importTaxableBase ⟨false, 10_000_000, 200_000, 300_000⟩ = 10_500_000 := by decide

-- 各要素だけが異なる場合
example : importTaxableBase ⟨true, 10_000_001, 200_000, 300_000⟩ = 10_500_001 := by decide
example : importTaxableBase ⟨true, 10_000_000, 200_001, 300_000⟩ = 10_500_001 := by decide
example : importTaxableBase ⟨true, 10_000_000, 200_000, 300_001⟩ = 10_500_001 := by decide

-- 金額 0 / 単純な小額
example : importTaxableBase ⟨true, 0, 0, 0⟩ = 0 := by decide
example : importTaxableBase ⟨false, 0, 0, 0⟩ = 0 := by decide
example : importTaxableBase ⟨true, 1, 0, 0⟩ = 1 := by decide
example : importTaxableBase ⟨true, 0, 2, 0⟩ = 2 := by decide
example : importTaxableBase ⟨true, 0, 0, 3⟩ = 3 := by decide
example : importTaxableBase ⟨false, 1, 2, 3⟩ = 6 := by decide

end JapanTaxLaw
