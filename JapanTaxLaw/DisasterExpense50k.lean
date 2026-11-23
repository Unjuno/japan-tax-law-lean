import JapanTaxLaw.TaxFinance

/-!
# DisasterExpense50k — 所得税法 art. 72（災害関連支出の金額 五万円超）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その年における損失の金額に含まれる災害関連支出の金額が五万円を超える場合」

Scoped claim: only the 災害関連支出の金額 五万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.DisasterExpense50k

def disasterFloor50k : Nat := 50000

def exceedsDisasterExpense50k (x : Nat) : Bool :=
  decide (disasterFloor50k < x)

theorem threshold_value : disasterFloor50k = 50000 := rfl

end JapanTaxLaw.DisasterExpense50k
