import JapanTaxLaw.TaxFinance

/-!
# TriggerPriceGapOver75Percent — 関税暫定措置法 art.7の4（差額 > 発動基準価格×75%）
Sources (pinned): law `335AC0000000036` / rev `335AC0000000036_20260401_508AC0000000005`.
原文: 「発動基準価格と課税価格との差額が発動基準価格に百分の七十五を乗じて得た金額を超える場合」
Computation: threshold(base) = base * 75 / 100; exceeds(gap, base) = gap > threshold(base)。
Scope: 価格の算定・手続は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.TriggerPriceGapOver75Percent

def percentNum : Nat := 75
def rateDen : Nat := 100

def threshold (base : Nat) : Nat := base * percentNum / rateDen

def exceeds (gap base : Nat) : Bool := gap > threshold base

example : threshold 100 = 75 := by decide
example : exceeds 76 100 = true := by decide
example : exceeds 75 100 = false := by decide

end JapanTaxLaw.TriggerPriceGapOver75Percent
