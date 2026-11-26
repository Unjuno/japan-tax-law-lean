import JapanTaxLaw.TaxFinance

/-!
# OkinawaTaxableQuantityResidual — 沖縄復帰国税省令 art. 20(1)(1の3) 課税標準数量（bounded slice）

Sources (pinned):
  Law id: 347M50000040042
  Revision: 347M50000040042_20251231_507M60000040072
  Raw snapshot: data/raw/347M50000040042_20251231_507M60000040072.law.json
  Normative id: NORM|2e5447d9cb81e83c203d8a3262428398e6f52bc95dbdb36b5a8c291862ebef16
  Article Num 20, paragraph 1, item 1の3.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「第一号の数量から前号の数量を控除した数量（以下この項において「課税標準数量」という。）」

Computation（単位: 数量。課税標準数量 = 第一号数量 − 前号数量、Nat 飽和）:
  taxableQuantity(firstQty, previousQty) =
    if previousQty <= firstQty then firstQty - previousQty else 0

Scope / NOT MODELLED:
  - 第一号・前号の数量の算定、対象貨物の認定、申告手続は NOT MODELLED。
  - 本モデルは差額計算の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.OkinawaTaxableQuantityResidual

/-- 第一号数量から前号数量を控除した課税標準数量（下限 0）。 -/
def taxableQuantity (firstQty : Nat) (previousQty : Nat) : Nat :=
  if previousQty <= firstQty then firstQty - previousQty else 0

example : taxableQuantity 0 0 = 0 := by decide
example : taxableQuantity 1 0 = 1 := by decide
example : taxableQuantity 100 40 = 60 := by decide
example : taxableQuantity 100 100 = 0 := by decide
example : taxableQuantity 100 140 = 0 := by decide

end JapanTaxLaw.OkinawaTaxableQuantityResidual
