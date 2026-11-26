import JapanTaxLaw.TaxFinance

/-!
# ReserveAccumulationAtMost25 — 租税特別措置法施行令 art.33の3「異常危険準備金累積割合が百分の二十五以下」

Sources (pinned): law `332CO0000000043`, revision `332CO0000000043_20261101_507CO0000000127`,
raw `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`.
原文逐語: 「異常危険準備金累積割合が百分の二十五以下の場合」
Computation: atMost25(rate) = rate <= 25（「以下」なので境界値 25 を含む）。
Scope: 割合の算定・適用先は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReserveAccumulationAtMost25

def thresholdNum : Nat := 25
def rateDen : Nat := 100

def atMost25 (rate : Nat) : Bool := rate <= thresholdNum

example : atMost25 24 = true := by decide
example : atMost25 25 = true := by decide
example : atMost25 26 = false := by decide

end JapanTaxLaw.ReserveAccumulationAtMost25
