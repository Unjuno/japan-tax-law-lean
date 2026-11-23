import JapanTaxLaw.TaxFinance

/-!
# DeceasedUnder70 — 租税特別措置法施行規則 art. 23_10（被相続人 七十歳未満）

Sources (pinned):

  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json

Pinned 原文: 「ただし、当該相続に係る被相続人が七十歳未満で死亡した場合は、この限りでない。」

Scoped claim: only the 被相続人 七十歳未満 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.DeceasedUnder70

def ageLimit70 : Nat := 70

def isDeceasedUnder70 (x : Nat) : Bool :=
  decide (x < ageLimit70)

theorem threshold_value : ageLimit70 = 70 := rfl

end JapanTaxLaw.DeceasedUnder70
