import JapanTaxLaw.TaxFinance

/-!
# GasolineTransferPayable — 揮発油税法 art. 10 移出に係る納付すべき税額（bounded slice）

Sources (pinned):
  Law id: 332AC0000000055
  Revision: 332AC0000000055_20260525_506AC0000000052
  Raw snapshot: data/raw/332AC0000000055_20260525_506AC0000000052.law.json
  Normative id: NORM|18ee592ed4fc85004c77200445b576ef0168e9660f0b08e6a4fad65396653d56
  Article Num 10.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「第六号に掲げる揮発油税額から前号に掲げる揮発油税額を控除した金額に相当する揮発油税額（以下「移出に係る納付すべき税額」という。）」

Computation（単位: 円）:
  transferPayable(sixthItemTax, previousItemTax) =
    if previousItemTax <= sixthItemTax then sixthItemTax - previousItemTax else 0

Scope / NOT MODELLED:
  - 各号の税額の算定、移出の認定、申告・納付手続は NOT MODELLED。
  - 本モデルは差額計算の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.GasolineTransferPayable

/-- 移出に係る納付すべき税額 = 第六号税額 − 前号税額（下限 0）。 -/
def transferPayable (sixthItemTax : Nat) (previousItemTax : Nat) : Nat :=
  if previousItemTax <= sixthItemTax then sixthItemTax - previousItemTax else 0

example : transferPayable 0 0 = 0 := by decide
example : transferPayable 100 40 = 60 := by decide
example : transferPayable 100 100 = 0 := by decide
example : transferPayable 100 140 = 0 := by decide

end JapanTaxLaw.GasolineTransferPayable
