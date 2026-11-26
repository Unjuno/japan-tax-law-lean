import JapanTaxLaw.TaxFinance

/-!
# AnnuityRatioOver50UpTo55 — 所得税法施行令 art.185「相続税評価割合が百分の五十を超え百分の五十五以下」
Sources (pinned): law `340CO0000000096`, revision `340CO0000000096_20260522_508CO0000000093`.
原文逐語: 「相続税評価割合が百分の五十を超え百分の五十五以下の場合」
Computation: inRange(rate) = rate > 50 && rate <= 55（下限「超え」は除外、上限「以下」は包含）。
Scope: 年金算定・課税関係は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.AnnuityRatioOver50UpTo55

def lowerNum : Nat := 50
def upperNum : Nat := 55
def rateDen : Nat := 100

def inRange (rate : Nat) : Bool := rate > lowerNum && rate <= upperNum

example : inRange 50 = false := by decide
example : inRange 51 = true := by decide
example : inRange 55 = true := by decide
example : inRange 56 = false := by decide

end JapanTaxLaw.AnnuityRatioOver50UpTo55
