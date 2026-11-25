import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxOrderOwnership50Threshold — 相続税法施行令 art.31 所有割合50%超（bounded L4 モデル）

Sources (pinned): law 325CO0000000071, revision 325CO0000000071_20260401_506CO0000000143,
raw data/raw/325CO0000000071_20260401_506CO0000000143.law.json.
原文逐語: 「前項の株主法人の株主又は社員である法人の発行済株式等の百分の五十を超える
株式等が同項の個人等により所有されている場合」
Computation（閾値判定のみ、入力は100分率の分子）:
  exceeds50(percent) = 50 < percent  （「超える」は境界値 50 を除外）
Scope / NOT MODELLED: 株主法人・個人等の定義・所有割合の算定・適用効果は NOT MODELLED。
本モデルは 50/100 の超過判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 50
def thresholdDen : Nat := 100

def exceeds50 (percent : Nat) : Bool :=
  thresholdNum < percent

example : exceeds50 49 = false := by decide
example : exceeds50 50 = false := by decide
example : exceeds50 51 = true := by decide

end JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold
