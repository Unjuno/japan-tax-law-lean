import JapanTaxLaw.TaxFinance

/-!
# OldLifePremium100k — 所得税法 art. 76（旧生命保険料の金額の合計額 十万円超）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その年中に支払つた旧生命保険料の金額の合計額が十万円を超える場合」

Scoped claim: only the 旧生命保険料の金額の合計額 十万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OldLifePremium100k

def oldLifeFloor100k : Nat := 100000

def exceedsOldLife100k (x : Nat) : Bool :=
  decide (oldLifeFloor100k < x)

theorem threshold_value : oldLifeFloor100k = 100000 := rfl

end JapanTaxLaw.OldLifePremium100k
