import JapanTaxLaw.TaxFinance

/-!
# Certificate200k — 関税法施行令 art. 61（締約国品目証明書 課税価格総額 二十万円以下）

Sources (pinned):

  Law id: 329CO0000000150
  Revision: 329CO0000000150_20260701_508CO0000000217
  Raw snapshot: data/raw/329CO0000000150_20260701_508CO0000000217.law.json

Pinned 原文: 「ただし、締約国品目証明書は、これに係る貨物の課税価格の総額が二十万円以下である場合にあつては、税関長の求めがあつたときに提出すれば足りる。」

Scoped claim: only the 締約国品目証明書 課税価格総額 二十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Certificate200k

def certificateCap200k : Nat := 200000

def withinCertificate200k (x : Nat) : Bool :=
  decide (x <= certificateCap200k)

theorem threshold_value : certificateCap200k = 200000 := rfl

end JapanTaxLaw.Certificate200k
