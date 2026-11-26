import JapanTaxLaw.TaxFinance

/-!
# SpecialRndDeduction20Percent — 租税特別措置法 art.10の2（特別試験研究費控除20%）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「…金額以外の金額の百分の二十に相当する金額」
Computation: amount(base) = base * 20 / 100（Nat の下限切り捨て）。
Scope: 控除対象額の算定・政令で定める金額は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialRndDeduction20Percent

def percentNum : Nat := 20
def rateDen : Nat := 100

def amount (base : Nat) : Nat := base * percentNum / rateDen

example : amount 100 = 20 := by decide
example : amount 1_000 = 200 := by decide

end JapanTaxLaw.SpecialRndDeduction20Percent
