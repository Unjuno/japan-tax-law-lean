import JapanTaxLaw.TaxFinance

/-!
# LocalFloorArea50_240 — 地方税法施行令 art. 9（床面積 五十平方メートル以上二百四十平方メートル以下）

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

Pinned 原文: 「床面積が五十平方メートル以上二百四十平方メートル以下のものであること。」

Scoped claim: only the 床面積 五十平方メートル以上二百四十平方メートル以下 numeric band; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalFloorArea50_240

def lowerBound : Nat := 50
def upperBound : Nat := 240

def inBand (x : Nat) : Bool :=
  decide (lowerBound <= x ∧ x <= upperBound)

theorem bounds_value : lowerBound = 50 ∧ upperBound = 240 := by
  constructor <;> rfl

end JapanTaxLaw.LocalFloorArea50_240
