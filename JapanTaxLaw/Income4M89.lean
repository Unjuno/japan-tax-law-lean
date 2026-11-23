import JapanTaxLaw.TaxFinance

/-!
# Income4M89 — 租税特別措置法 art. 41_16_2（合計所得金額 四百八十九万円超）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「その居住者のその年分の所得税に係る合計所得金額が四百八十九万円を超える場合」

Scoped claim: only the 合計所得金額 四百八十九万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Income4M89

def incomeFloor4M89 : Nat := 4890000

def exceedsIncome4M89 (x : Nat) : Bool :=
  decide (incomeFloor4M89 < x)

theorem threshold_value : incomeFloor4M89 = 4890000 := rfl

end JapanTaxLaw.Income4M89
