import JapanTaxLaw.TaxFinance

/-!
# Income1320k — 租税特別措置法 art. 41_16_2（合計所得金額の見積額 百三十二万円以下）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「その居住者のその年分の所得税に係る合計所得金額が百三十二万円以下である場合」

Scoped claim: only the 合計所得金額の見積額 百三十二万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Income1320k

def incomeCap1320k : Nat := 1320000

def withinIncome1320k (x : Nat) : Bool :=
  decide (x <= incomeCap1320k)

theorem threshold_value : incomeCap1320k = 1320000 := rfl

end JapanTaxLaw.Income1320k
