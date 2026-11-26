import JapanTaxLaw.TaxFinance

/-!
# InheritedAnnuityRatioAtMost50 — 所得税法施行令 art.185「相続税評価割合が百分の五十以下の確定年金」
Sources (pinned): law `340CO0000000096`, revision `340CO0000000096_20260522_508CO0000000093`.
原文逐語: 「相続税評価割合が百分の五十以下の確定年金」
Computation: atMost50(rate) = rate <= 50（「以下」なので境界値 50 を含む）。
Scope: 年金算定・課税関係は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.InheritedAnnuityRatioAtMost50

def thresholdNum : Nat := 50
def rateDen : Nat := 100

def atMost50 (rate : Nat) : Bool := rate <= thresholdNum

example : atMost50 49 = true := by decide
example : atMost50 50 = true := by decide
example : atMost50 51 = false := by decide

end JapanTaxLaw.InheritedAnnuityRatioAtMost50
