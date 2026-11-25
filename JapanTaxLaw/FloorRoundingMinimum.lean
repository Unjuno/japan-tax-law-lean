import JapanTaxLaw.TaxFinance

/-!
# FloorRoundingMinimum — 42 の 切り捨て（端数処理）規定

Each pinned unit discards a remainder below a threshold (一/百/五百/千/一万円
未満の端数). Some additionally state a minimum: when the whole amount is below
the threshold the result is a fixed minimum (百円 / 一円) rather than zero.
The underlying amount computation is caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.FloorRoundingMinimum

/-- 閾値未満の端数を切り捨て（最大の閾値倍数）。 -/
def floorAt (amount threshold : Nat) : Nat :=
  if threshold = 0 then amount else amount - amount % threshold

/-- 全額が閾値未満のときは最低額 `minimum` とする（原文の「〜とする」）。 -/
def floorOrMinimum (amount threshold minimum : Nat) : Nat :=
  if amount < threshold then minimum else floorAt amount threshold

/-- pinned 閾値（円）。 -/
def oneYen : Nat := 1
def hundredYen : Nat := 100
def fiveHundredYen : Nat := 500
def thousandYen : Nat := 1000
def tenThousandYen : Nat := 10_000

example : floorAt 1_499 1000 = 1000 := by decide
example : floorAt 1_500 1000 = 1000 := by decide
example : floorOrMinimum 99 100 100 = 100 := by decide
example : floorOrMinimum 100 100 100 = 100 := by decide
example : floorOrMinimum 1_499 1000 0 = 1000 := by decide

end JapanTaxLaw.FloorRoundingMinimum
