import JapanTaxLaw.TaxFinance

/-!
# MoneyRoundingThresholds — 67 の pinned 金額端数処理規定 (60 切捨 / 7 切上)

Every pinned unit states: when an amount has a remainder below a threshold
(一円 / 百円 / 千円 未満の端数), either discard it (切り捨て, 60 units) or round
up to the next multiple (切り上げ, 7 units). The direction is read verbatim
from each unit; some units round share counts (一株未満) rather than money.

Model: `roundDown a t = a - a%t` and `roundUp a t = a + (t - a%t)` when the
remainder is nonzero, with thresholds drawn from the pinned values (1, 100,
1000). The underlying tax computation is caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.MoneyRoundingThresholds

/-- 実装: 閾値未満の端数を切り捨て（最大の閾値倍数）。 -/
def roundDown (amount threshold : Nat) : Nat :=
  if threshold = 0 then amount else amount - amount % threshold

/-- 実装: 閾値未満の端数を切り上げ（「切り上げる」と明記された規定用）。 -/
def roundUp (amount threshold : Nat) : Nat :=
  if threshold = 0 then amount
  else if amount % threshold = 0 then amount
  else amount + (threshold - amount % threshold)

/-- 三つの pinned 閾値。 -/
def oneYen : Nat := 1
def hundredYen : Nat := 100
def thousandYen : Nat := 1000

/-- 全額が閾値未満なら零（原文の「その全額を切り捨てる」）。 -/
theorem belowThresholdIsZero (amount threshold : Nat) (h : amount < threshold) :
    roundDown amount threshold = 0 := by
  unfold roundDown
  by_cases hz : threshold = 0
  · omega
  · simp [hz]
    have hmod : amount % threshold = amount := Nat.mod_eq_of_lt h
    rw [hmod, Nat.sub_self]

end JapanTaxLaw.MoneyRoundingThresholds
