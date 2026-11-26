import JapanTaxLaw.TaxFinance

/-!
# ReserveAccumulationOver50UpTo75 — 租税特別措置法施行令 art.33の3（50%超75%以下）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「異常危険準備金累積割合が百分の五十を超え百分の七十五以下の場合」
Computation: inRange(rate) = rate > 50 && rate <= 75（下限除外・上限包含）。
Scope: 割合の算定・適用先は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReserveAccumulationOver50UpTo75

def lowerNum : Nat := 50
def upperNum : Nat := 75
def rateDen : Nat := 100

def inRange (rate : Nat) : Bool := rate > lowerNum && rate <= upperNum

example : inRange 50 = false := by decide
example : inRange 51 = true := by decide
example : inRange 75 = true := by decide
example : inRange 76 = false := by decide

end JapanTaxLaw.ReserveAccumulationOver50UpTo75
