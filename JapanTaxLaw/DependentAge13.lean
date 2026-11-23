import JapanTaxLaw.TaxFinance

/-!
# DependentAge13 — 所得税法 art. 3（扶養親族の年齢 十三歳以上）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「扶養親族に該当するかどうか及び居住者の扶養親族の年齢が十三歳以上であるかどうかの判定」

Scoped claim: only the 扶養親族の年齢 十三歳以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.DependentAge13

def ageFloor13 : Nat := 13

def isDependentAge13 (x : Nat) : Bool :=
  decide (ageFloor13 <= x)

theorem threshold_value : ageFloor13 = 13 := rfl

end JapanTaxLaw.DependentAge13
