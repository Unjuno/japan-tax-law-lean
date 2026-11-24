import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresOrderRate75 — 租税特別措置法施行令 art.5の5 政令割合 75%（bounded L4 モデル）

Sources (pinned): law 332CO0000000043, revision 332CO0000000043_20261101_507CO0000000127,
raw data/raw/332CO0000000043_20261101_507CO0000000127.law.json.
原文逐語: 「法第十条の三第一項に規定する政令で定める割合は、百分の七十五とする。」
Computation（割合の適用のみ、Nat の下限切り捨て）:
  delegatedAmount(base) = base * 75 / 100
Scope / NOT MODELLED: 法第10条の3第1項の要件・基礎となる金額の算定・端数処理は
NOT MODELLED。本モデルは 75/100 の割合のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresOrderRate75

open JapanTaxLaw.TaxFinance

def rateNum : Nat := 75
def rateDen : Nat := 100

def delegatedAmount (base : Money) : Money :=
  base * rateNum / rateDen

example : delegatedAmount 0 = 0 := by decide
example : delegatedAmount 1 = 0 := by decide
example : delegatedAmount 100 = 75 := by decide
example : delegatedAmount 1_000 = 750 := by decide

end JapanTaxLaw.SpecialMeasuresOrderRate75
