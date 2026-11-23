import JapanTaxLaw.TaxFinance

/-!
# IncomeSupport380kArt2 — 所得税法 art. 2（生活費・教育費の支払 三十八万円以上）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その居住者からその年において生活費又は教育費に充てるための支払を三十八万円以上受けている者」

Scoped claim: only the 生活費・教育費の支払 三十八万円以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.IncomeSupport380kArt2

def supportFloor380k : Nat := 380000

def hasSupport380k (x : Nat) : Bool :=
  decide (supportFloor380k <= x)

theorem threshold_value : supportFloor380k = 380000 := rfl

end JapanTaxLaw.IncomeSupport380kArt2
