import JapanTaxLaw.TaxFinance

/-
# OwnershipPercent5 — 租税特別措置法施行令 第一条の八（社外株式五パーセント所有）

Pinned source:
  Law id: 329CO0000000155
  Revision: 329CO0000000155_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
  sha256: 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01
  Statutory article: 第一条の八 (art. 1の8; raw JSON Article attr.Num = "1_8")

原文逐語（pinned, 一字一句改変なし, scoped Article 1の8）:
  「いずれか一方の者が他方の者の事業に係る議決権を伴う社外株式の総数の五パーセント以上の社外株式を直接又は間接に所有し、管理し、又は所持している場合」

Variable contract:
  `percent : Nat` = 社外株式の所有割合 (単位 パーセント, whole percentage points).
  五パーセント以上 = percent >= 5, INCLUSIVE (5 itself meets the threshold).

Scope: ONLY the explicit numeric percentage threshold 五パーセント = 5% is
  modelled, as a corporate ownership-percentage threshold (all/%/shares).
  It is distinct from money and count thresholds. 議決権, 社外株式, 直接又は間接,
  所有・管理・所持, いずれか一方の者 and the other art. 1の8 language are
  qualitative/non-numeric and are OUT OF SCOPE. No division or rounding.

No `sorry`, `admit`, `axiom` or `Classical.choice`. The predicate is a direct
Bool relation via `decide`; no order typeclass instance is introduced.
-/

namespace JapanTaxLaw.OwnershipPercent5

/-- 五パーセント — the statutory ownership threshold, as a Nat percentage. -/
def ownershipThresholdPercent : Nat := 5

/-- 五パーセント以上 — true iff `percent` is at least 5 % (INCLUSIVE). -/
def meetsOwnershipThreshold (percent : Nat) : Bool :=
  decide (ownershipThresholdPercent <= percent)

/-- 0 % is below 五パーセント. -/
theorem meetsOwnershipThreshold_zero : meetsOwnershipThreshold 0 = false := by
  decide

/-- 4 % is below 五パーセント. -/
theorem meetsOwnershipThreshold_four : meetsOwnershipThreshold 4 = false := by
  decide

/-- 5 % meets 五パーセント以上 (inclusive boundary). -/
theorem meetsOwnershipThreshold_five : meetsOwnershipThreshold 5 = true := by
  decide

/-- 6 % meets 五パーセント以上. -/
theorem meetsOwnershipThreshold_six : meetsOwnershipThreshold 6 = true := by
  decide

/-- The statutory percentage literal is exactly five. -/
theorem ownershipThresholdPercent_is_five : ownershipThresholdPercent = 5 := by
  decide

end JapanTaxLaw.OwnershipPercent5
