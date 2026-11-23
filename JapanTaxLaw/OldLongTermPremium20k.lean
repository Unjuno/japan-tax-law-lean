import JapanTaxLaw.TaxFinance

/-!
# OldLongTermPremium20k — 所得税法 art. 10（旧長期損害保険料 二万円超）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その年中に支払った旧長期損害保険料の金額の合計額が二万円を超える場合」

Scoped claim: only the 旧長期損害保険料 二万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OldLongTermPremium20k

def premiumFloor20k : Nat := 20000

def exceedsPremium20k (x : Nat) : Bool :=
  decide (premiumFloor20k < x)

theorem threshold_value : premiumFloor20k = 20000 := rfl

end JapanTaxLaw.OldLongTermPremium20k
