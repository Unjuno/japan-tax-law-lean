import JapanTaxLaw.TaxFinance

/-!
# RndExcess0To12 — 租税特別措置法 art.10「零以上であり百分の十二以下」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「増減試験研究費割合が零以上であり百分の十二以下である場合（ニに掲げる場合を除く。）」
Computation（区間の境界判定のみ。入力は100分率の分子）:
  inRange(rate) = rate >= 0 && rate <= 12   （下限「零以上」、上限「十二以下」を含む）
Scope / NOT MODELLED: 「ニに掲げる場合」の例外、割合の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RndExcess0To12

open JapanTaxLaw.TaxFinance

def upperNum : Nat := 12
def rateDen : Nat := 100

def inRange (rate : Nat) : Bool :=
  rate >= 0 && rate <= upperNum

example : inRange 0 = true := by decide
example : inRange 12 = true := by decide
example : inRange 13 = false := by decide

end JapanTaxLaw.RndExcess0To12
