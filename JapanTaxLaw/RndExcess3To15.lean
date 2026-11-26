import JapanTaxLaw.TaxFinance

/-!
# RndExcess3To15 — 租税特別措置法 art.10「百分の三を超え百分の十五以下」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「増減試験研究費割合が百分の三を超え百分の十五以下である場合（ニに掲げる場合を除く。）」
Computation（区間の境界判定のみ。入力は100分率の分子）:
  inRange(rate) = rate > 3 && rate <= 15   （下限は「超え」で除外、上限は「以下」で含む）
Scope / NOT MODELLED: 「ニに掲げる場合」の例外、割合の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RndExcess3To15

open JapanTaxLaw.TaxFinance

def lowerNum : Nat := 3
def upperNum : Nat := 15
def rateDen : Nat := 100

def inRange (rate : Nat) : Bool :=
  rate > lowerNum && rate <= upperNum

example : inRange 3 = false := by decide
example : inRange 4 = true := by decide
example : inRange 15 = true := by decide
example : inRange 16 = false := by decide

end JapanTaxLaw.RndExcess3To15
