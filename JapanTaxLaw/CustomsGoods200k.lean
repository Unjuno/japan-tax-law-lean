import JapanTaxLaw.TaxFinance

/-!
# CustomsGoods200k — 関税暫定措置法施行令 art. 31（課税価格の総額 二十万円以下（物品））

Sources (pinned):

  Law id: 335CO0000000069
  Revision: 335CO0000000069_20260401_508CO0000000085
  Raw snapshot: data/raw/335CO0000000069_20260401_508CO0000000085.law.json

Pinned 原文: 「ただし、課税価格の総額が二十万円以下の物品については、この限りでない。」

Scoped claim: only the 課税価格の総額 二十万円以下（物品） threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CustomsGoods200k

def customsGoodsCap200k : Nat := 200000

def withinCustomsGoods200k (x : Nat) : Bool :=
  decide (x <= customsGoodsCap200k)

theorem threshold_value : customsGoodsCap200k = 200000 := rfl

end JapanTaxLaw.CustomsGoods200k
