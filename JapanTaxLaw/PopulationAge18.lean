import JapanTaxLaw.TaxFinance

/-!
# PopulationAge18 — 地方交付税法 art. 12（十八歳以下の人口）

Sources (pinned):

  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062
  Raw snapshot: data/raw/325AC0000000211_20261102_508AC0000000062.law.json

Pinned 原文: 「最近の国勢調査の結果による当該地方団体の十八歳以下の人口」

Scoped claim: only the 十八歳以下の人口 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.PopulationAge18

def ageCeiling : Nat := 18

def withinAge18 (x : Nat) : Bool :=
  decide (x <= ageCeiling)

theorem threshold_value : ageCeiling = 18 := rfl

end JapanTaxLaw.PopulationAge18
