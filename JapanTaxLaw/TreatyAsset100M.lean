import JapanTaxLaw.TaxFinance

/-!
# TreatyAsset100M — 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令 art. 6_6（特定取引契約資産額 一億円超）

Sources (pinned):

  Law id: 362CO0000000335
  Revision: 362CO0000000335_20260521_506CO0000000150
  Raw snapshot: data/raw/362CO0000000335_20260521_506CO0000000150.law.json

Pinned 原文: 「次に掲げる特定取引契約資産額がそれぞれ次に定める日以後最初に一億円を超えることとなつた場合」

Scoped claim: only the 特定取引契約資産額 一億円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.TreatyAsset100M

def treatyAssetFloor100M : Nat := 100000000

def exceedsTreatyAsset100M (x : Nat) : Bool :=
  decide (treatyAssetFloor100M < x)

theorem threshold_value : treatyAssetFloor100M = 100000000 := rfl

end JapanTaxLaw.TreatyAsset100M
