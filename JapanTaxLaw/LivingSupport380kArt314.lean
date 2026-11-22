import JapanTaxLaw.TaxFinance

/-!
# LivingSupport380kArt314 — 地方税法 art. 314_2（生活費・教育費の支払 三十八万円以上）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「その市町村民税の納税義務者から前年において生活費又は教育費に充てるための支払を三十八万円以上受けている者」

Scoped claim: only the 生活費・教育費の支払 三十八万円以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LivingSupport380kArt314

def supportFloorArt314 : Nat := 380000

def hasSupport380k (x : Nat) : Bool :=
  decide (supportFloorArt314 <= x)

theorem threshold_value : supportFloorArt314 = 380000 := rfl

end JapanTaxLaw.LivingSupport380kArt314
