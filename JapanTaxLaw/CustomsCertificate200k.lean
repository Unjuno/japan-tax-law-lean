import JapanTaxLaw.TaxFinance

/-!
# CustomsCertificate200k — 関税暫定措置法施行令 art. 31（課税価格の総額 二十万円以下（物品又は特例申告貨物））

Sources (pinned):

  Law id: 335CO0000000069
  Revision: 335CO0000000069_20260401_508CO0000000085
  Raw snapshot: data/raw/335CO0000000069_20260401_508CO0000000085.law.json

Pinned 原文: 「ただし、課税価格の総額が二十万円以下の物品又は特例申告貨物については、この限りでない。」

Scoped claim: only the 課税価格の総額 二十万円以下（物品又は特例申告貨物） threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CustomsCertificate200k

def customsCertCap200k : Nat := 200000

def withinCustomsCert200k (x : Nat) : Bool :=
  decide (x <= customsCertCap200k)

theorem threshold_value : customsCertCap200k = 200000 := rfl

end JapanTaxLaw.CustomsCertificate200k
