import JapanTaxLaw.TaxFinance

/-!
# InheritedAnnuityRatioOver50 — 所得税法施行令 art.185「相続税評価割合が百分の五十を超える確定年金」
Sources (pinned): law `340CO0000000096`, revision `340CO0000000096_20260522_508CO0000000093`.
原文逐語: 「相続税評価割合が百分の五十を超える確定年金」
Computation: over50(rate) = rate > 50（「超える」なので境界値 50 は除外）。
Scope: 年金の算定・課税関係は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.InheritedAnnuityRatioOver50

def thresholdNum : Nat := 50
def rateDen : Nat := 100

def over50 (rate : Nat) : Bool := rate > thresholdNum

example : over50 49 = false := by decide
example : over50 50 = false := by decide
example : over50 51 = true := by decide

end JapanTaxLaw.InheritedAnnuityRatioOver50
