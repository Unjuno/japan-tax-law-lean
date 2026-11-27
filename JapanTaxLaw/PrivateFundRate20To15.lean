import JapanTaxLaw.TaxFinance

/-!
# PrivateFundRate20To15 — 租税特別措置法 art.8の2（20%→15%読み替え）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「…百分の二十の税率は、百分の十五の税率とする。」
Computation: read(rate) = if rate == 20 then 15 else rate（100分率の分子を置換）。
Scope: 適用対象の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.PrivateFundRate20To15

def sourceNum : Nat := 20
def replacementNum : Nat := 15

def readRate (rate : Nat) : Nat :=
  if rate == sourceNum then replacementNum else rate

example : readRate 20 = 15 := by decide
example : readRate 10 = 10 := by decide
example : readRate 25 = 25 := by decide

end JapanTaxLaw.PrivateFundRate20To15
