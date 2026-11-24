import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresOwnershipThreshold50 — 租税特別措置法施行令 art.19の3 所有割合 50%超（bounded L4 モデル）

Sources (pinned): law 332CO0000000043, revision 332CO0000000043_20261101_507CO0000000127,
raw data/raw/332CO0000000043_20261101_507CO0000000127.law.json.
原文逐語: 「発行済株式等の総数又は総額の百分の五十を超える数又は金額の株式が当該株式会社により所有されている場合」
Computation（閾値判定のみ、入力は100分率の分子）:
  exceeds50(percent) = 50 < percent  （「超える」は境界値 50 を除外）
Scope / NOT MODELLED: 株主等の定義・所有割合の算定・適用効果は NOT MODELLED。
本モデルは 50/100 の超過判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresOwnershipThreshold50

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 50
def thresholdDen : Nat := 100

def exceeds50 (percent : Nat) : Bool :=
  thresholdNum < percent

example : exceeds50 49 = false := by decide
example : exceeds50 50 = false := by decide
example : exceeds50 51 = true := by decide

end JapanTaxLaw.SpecialMeasuresOwnershipThreshold50
