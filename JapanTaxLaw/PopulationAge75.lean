import JapanTaxLaw.TaxFinance

/-!
# PopulationAge75 — 地方交付税法 art. 12（七十五歳以上の人口）

Sources (pinned):

  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062
  Raw snapshot: data/raw/325AC0000000211_20261102_508AC0000000062.law.json

Pinned 原文: 「最近の国勢調査の結果による当該地方団体の七十五歳以上の人口」

Scoped claim: only the 七十五歳以上の人口 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.PopulationAge75

def ageFloor75 : Nat := 75

def isAge75OrOver (x : Nat) : Bool :=
  decide (ageFloor75 <= x)

theorem threshold_value : ageFloor75 = 75 := rfl

end JapanTaxLaw.PopulationAge75
