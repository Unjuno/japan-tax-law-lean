import JapanTaxLaw.TaxFinance

/-!
# OldLifePremium9k — 所得税法施行令 art. 319（旧生命保険料 九千円超）

Sources (pinned):

  Law id: 340CO0000000096
  Revision: 340CO0000000096_20260522_508CO0000000093
  Raw snapshot: data/raw/340CO0000000096_20260522_508CO0000000093.law.json

Pinned 原文: 「当該九千円を超える旧生命保険料の金額その他財務省令で定める事項」

Scoped claim: only the 旧生命保険料 九千円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OldLifePremium9k

def oldLifeFloor9k : Nat := 9000

def exceedsOldLife9k (x : Nat) : Bool :=
  decide (oldLifeFloor9k < x)

theorem threshold_value : oldLifeFloor9k = 9000 := rfl

end JapanTaxLaw.OldLifePremium9k
