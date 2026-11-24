import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresDistributionRatio90 — 租税特別措置法 art.68の3の3 収益分配割合 >90%（bounded L4 モデル）

Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013,
raw data/raw/332AC0000000026_20261101_507AC0000000013.law.json.
原文逐語: 「当該事業年度に係る収益の分配の額の分配可能収益の額に占める割合として
政令で定める割合が百分の九十を超えていること。」
Computation（閾値判定のみ、入力は100分率の分子）:
  exceeds90(ratePerHundred) = ratePerHundred > 90  （「超える」は境界値を除外）
Scope / NOT MODELLED: 分配可能収益額・政令で定める割合の算定・適用効果・端数は NOT MODELLED。
本モデルは 90/100 の超過判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresDistributionRatio90

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 90
def thresholdDen : Nat := 100

def exceeds90 (ratePerHundred : Nat) : Bool :=
  thresholdNum < ratePerHundred

example : exceeds90 89 = false := by decide
example : exceeds90 90 = false := by decide
example : exceeds90 91 = true := by decide

end JapanTaxLaw.SpecialMeasuresDistributionRatio90
