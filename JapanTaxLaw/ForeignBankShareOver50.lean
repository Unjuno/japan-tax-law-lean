import JapanTaxLaw.TaxFinance

/-!
# ForeignBankShareOver50 — 租税特別措置法施行令 art.39の17（持株50%超）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「…発行済株式等の百分の五十を超える数又は金額の株式等を有するもの」
Computation: over50(rate) = rate > 50（「超える」なので境界値 50 は除外）。
Scope: 持株数の算定・外国金融機関の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignBankShareOver50

def thresholdNum : Nat := 50
def rateDen : Nat := 100

def over50 (rate : Nat) : Bool := rate > thresholdNum

example : over50 49 = false := by decide
example : over50 50 = false := by decide
example : over50 51 = true := by decide

end JapanTaxLaw.ForeignBankShareOver50
