import JapanTaxLaw.TaxFinance

/-!
# LiquorTaxBand15to16 — 酒税法 art. 38（アルコール分 十五度以上十六度未満）

Sources (pinned):

  Law id: 328AC0000000006
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json

Pinned 原文: 「アルコール分が十五度以上十六度未満のもの　二十七万九千五百円」

Scoped claim: only the アルコール分 十五度以上十六度未満 half-open band; the associated tax amount is
caller-established (the bracket literal is transcribed, the rate table is not).
-/

namespace JapanTaxLaw.LiquorTaxBand15to16

def lowerBound : Nat := 15
def upperBound : Nat := 16

def inBand (x : Nat) : Bool :=
  decide (lowerBound <= x ∧ x < upperBound)

theorem bounds_value : lowerBound = 15 ∧ upperBound = 16 := by
  constructor <;> rfl

end JapanTaxLaw.LiquorTaxBand15to16
