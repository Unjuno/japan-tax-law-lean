import JapanTaxLaw.TaxFinance

/-
# AntennaPowerCeiling — 登録免許税法施行令 第十二条（空中線電力五百ワット以下）

Pinned source:
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
  Statutory article: 第十二条 (art. 12; raw JSON Article attr.Num = "12";
  needle verified verbatim in the scoped Article 12 text by independent
  re-extraction; whole-file SHA-256 pinned above).

原文逐語（pinned, 一字一句改変なし）:
  「法別表第一第五十四号（二）に規定する政令で定める登録は、基本送信機の規模が空中線電力五百ワット以下の無線局の登録とする。」

Variable contract:
  `watts : Nat` = 空中線電力 (antenna power of the basic transmitter),
  unit ワット (W), whole watts.
  `powerCeilingWatts : Nat := 500` = 五百ワット (500 W).
  `withinPowerCeiling watts := decide (watts <= powerCeilingWatts)`:
  「以下」 is INCLUSIVE (<=), so exactly 500 W is registrable and 501 W is not.

Scope: ONLY the explicit numeric antenna-power threshold in the pinned needle
  is modelled — 五百ワット = 500 W and 「以下」 = inclusive <=. This is a
  physical-unit (watts) threshold, distinct from money/count thresholds. 法別表
  第一第五十四号（二）, the remaining text of Article 12, other articles and the
  actual registration procedure are NOT MODELLED.

All proofs are kernel-decided (`decide`) or `rfl`; no classical or noncomputable machinery is used.
-/

namespace JapanTaxLaw.AntennaPowerCeiling

/-- 五百ワット = 500 W. Unit ワット (W); domain Nat. -/
def powerCeilingWatts : Nat := 500

/-- 「空中線電力五百ワット以下」: watts <= 500 (以下 = inclusive). -/
def withinPowerCeiling (watts : Nat) : Bool :=
  decide (watts <= powerCeilingWatts)

/-- 0 W is within the ceiling. -/
theorem zero_true : withinPowerCeiling 0 = true := by
  decide

/-- 1 W is within the ceiling (small positive input). -/
theorem one_true : withinPowerCeiling 1 = true := by
  decide

/-- 499 W (五百ワット minus one) is still within the ceiling. -/
theorem below_true : withinPowerCeiling 499 = true := by
  decide

/-- Exactly 五百ワット (500 W) is within the ceiling: 以下 is inclusive. -/
theorem at_true : withinPowerCeiling 500 = true := by
  decide

/-- 501 W is beyond the ceiling. -/
theorem above_false : withinPowerCeiling 501 = false := by
  decide

/-- The statutory antenna-power ceiling is exactly 五百ワット = 500 W. -/
theorem ceiling_is_500 : powerCeilingWatts = 500 := by
  decide

end JapanTaxLaw.AntennaPowerCeiling
