import JapanTaxLaw.TaxFinance

/-!
# LocalFloorArea40_240 — 地方税法施行令 art. 12（住宅の床面積 四十平方メートル以上二百四十平方メートル以下）

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

Pinned 原文: 「床面積が四十平方メートル以上二百四十平方メートル以下である住宅」

Scoped claim: only the 住宅の床面積 四十平方メートル以上二百四十平方メートル以下 numeric band; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalFloorArea40_240

def lowerBound : Nat := 40
def upperBound : Nat := 240

def inBand (x : Nat) : Bool :=
  decide (lowerBound <= x ∧ x <= upperBound)

theorem bounds_value : lowerBound = 40 ∧ upperBound = 240 := by
  constructor <;> rfl

end JapanTaxLaw.LocalFloorArea40_240
