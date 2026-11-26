import JapanTaxLaw.TaxFinance

/-!
# ExtraDepreciationBelow10 — 所得税法施行令 art.133「増加償却割合が百分の十に満たない」

Sources (pinned): law `340CO0000000096`, revision `340CO0000000096_20260522_508CO0000000093`.
原文逐語: 「ただし、当該増加償却割合が百分の十に満たない場合は、この限りでない。」
Computation: below10(rate) = rate < 10（「満たない」なので境界値 10 は除外）。
Scope: 割合の算定・適用除外の全体は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ExtraDepreciationBelow10

def thresholdNum : Nat := 10
def rateDen : Nat := 100

def below10 (rate : Nat) : Bool := rate < thresholdNum

example : below10 9 = true := by decide
example : below10 10 = false := by decide
example : below10 11 = false := by decide

end JapanTaxLaw.ExtraDepreciationBelow10
