import JapanTaxLaw.TaxFinance

/-!
# TaxableQuantityResidual — 酒税法 art. 30の2(1)(3) 課税標準数量（差額）bounded slice

Sources (pinned):
  Law id: 328AC0000000006
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json
  Normative id: NORM|3f049c7ac5a29e667cddf5a3310f6887f45eeae97b97e43ecf1ab0b0517c5adb
  Article Num 30_2, paragraph 1, item 3.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「第一号に規定する課税標準たる数量からそれぞれ当該税率の適用区分ごとに前号に規定する課税標準たる数量を控除した数量（以下この項において「課税標準数量」という。）」

Computation（単位: 数量。課税標準数量 = 第一号の数量 - 前号の数量、Nat 飽和）:
  taxableQuantity(base, deducted) = base - min deducted base

Scope / NOT MODELLED:
  - 第一号・前号の数量の算定、税率の適用区分の認定、端数処理は
    NOT MODELLED。Those quantities are explicit provider inputs.
  - 本モデルは差額計算の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxableQuantityResidual

/-- 第一号の課税標準数量から前号の課税標準数量を控除した数量（下限 0）。 -/
def taxableQuantity (base : Nat) (deducted : Nat) : Nat :=
  let d := if deducted < base then deducted else base
  base - d

example : taxableQuantity 0 0 = 0 := by decide
example : taxableQuantity 1 0 = 1 := by decide
example : taxableQuantity 100 40 = 60 := by decide
example : taxableQuantity 100 100 = 0 := by decide
example : taxableQuantity 100 150 = 0 := by decide

end JapanTaxLaw.TaxableQuantityResidual
