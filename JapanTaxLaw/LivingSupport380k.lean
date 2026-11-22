import JapanTaxLaw.TaxFinance

/-!
# LivingSupport380k — 地方税法 34（生活費・教育費の支払 三十八万円以上）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「その道府県民税の納税義務者から前年において生活費又は教育費に充てるための支払を三十八万円以上受けている者」

Scoped claim: only the 生活費・教育費の支払 三十八万円以上; other conditions are caller-established.
-/

namespace JapanTaxLaw.LivingSupport380k

def supportFloorYen : Nat := 380000

def isSupported (x : Nat) : Bool :=
  decide (supportFloorYen <= x)

theorem threshold_value : supportFloorYen = 380000 := rfl

end JapanTaxLaw.LivingSupport380k
