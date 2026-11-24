import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresRealEstateRatio75 — 租税特別措置法 art.83の2の2 特定不動産割合 ≥75%（bounded L4 モデル）

Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013,
raw data/raw/332AC0000000026_20261101_507AC0000000013.law.json.
原文逐語: 「特定不動産の割合が百分の七十五以上であること。」
Computation（閾値判定のみ、入力は100分率の分子）:
  atLeast75(ratePerHundred) = 75 <= ratePerHundred  （「以上」は境界値を含む）
Scope / NOT MODELLED: 特定不動産の定義・割合の算定・適用効果・端数は NOT MODELLED。
本モデルは 75/100 の以上判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresRealEstateRatio75

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 75
def thresholdDen : Nat := 100

def atLeast75 (ratePerHundred : Nat) : Bool :=
  thresholdNum <= ratePerHundred

example : atLeast75 74 = false := by decide
example : atLeast75 75 = true := by decide
example : atLeast75 76 = true := by decide

end JapanTaxLaw.SpecialMeasuresRealEstateRatio75
