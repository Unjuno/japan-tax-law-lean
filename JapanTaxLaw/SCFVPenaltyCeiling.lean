import JapanTaxLaw.TaxFinance

/-
# SCFVPenaltyCeiling — 在日米軍特例法 art.11(3)（罰則の数値上限）

Pinned source:
  Law id: 327AC0000000111
  Revision: 327AC0000000111_20250601_504AC0000000068
  Raw snapshot: data/raw/327AC0000000111_20250601_504AC0000000068.law.json
  sha256: 04223c3926ac2a26dd0ff9120a712b6e3aa4af0285455db1be9163bd7074c1b2
  Provision: MainProvision / Article Num 11 / Paragraph 3

原文逐語（pinned, 一字一句改変なし）:
  「第一項の規定に違反した者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

原文の二つの数値上限（いずれも原文の直接値、換算なし）:
  imprisonmentCeilingYears = 1        （一年以下）      unit 年
  fineCeilingYen            = 500,000 （五十万円以下）  unit 円
  「以下」は inclusive (<=)。境界値 1 年 / 500,000 円は上限内。

Variable contract:
  `years : Nat` = 拘禁刑の期間, unit 年 (years). Direct statutory value: 一年 = 1.
  `yen : Nat`    = 罰金の額,     unit 円 (yen).
  Both are independent axes; 年 and 円 are dimensionally distinct and must
  never be compared or mixed with each other (§3 dimensional consistency).
  No 月 conversion is performed: 「一年」 is modelled directly as 1 年.

Scope: 本スライスは罰則の二つの明示的な数値上限のみを扱う。
  「又は」による代替関係、第一項の違反要件（用途外譲渡・政令承認）、
  第二項の徴収、第四項の法人重課、附則第十一条の経過措置は NOT MODELLED。
  実際の科刑は司法判断であり、本モデルは法的レビューを提供しない。
  No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SCFVPenaltyCeiling

open JapanTaxLaw.TaxFinance

/-- 「一年以下」の直接値 = 1 年。Unit 年; domain Nat. -/
def imprisonmentCeilingYears : Nat := 1

/-- 罰金の上限 = 五十万円。Unit 円; domain Nat. -/
def fineCeilingYen : Nat := 500_000

/-- 「一年以下の拘禁刑」: years ≤ 1 (inclusive). Unit 年. -/
def withinImprisonmentCeiling (years : Nat) : Bool :=
  decide (years <= imprisonmentCeilingYears)

/-- 「五十万円以下の罰金」: yen ≤ 500,000 (inclusive). Unit 円. -/
def withinFineCeiling (yen : Nat) : Bool :=
  decide (yen <= fineCeilingYen)

/-- Bool ↔ Prop bridge for the imprisonment axis (universal, kernel-checked). -/
theorem withinImprisonmentCeiling_iff (years : Nat) :
    withinImprisonmentCeiling years = true ↔ years <= imprisonmentCeilingYears := by
  by_cases h : years <= imprisonmentCeilingYears
  · simp [withinImprisonmentCeiling, h]
  · simp [withinImprisonmentCeiling, h]

/-- Bool ↔ Prop bridge for the fine axis (universal, kernel-checked). -/
theorem withinFineCeiling_iff (yen : Nat) :
    withinFineCeiling yen = true ↔ yen <= fineCeilingYen := by
  by_cases h : yen <= fineCeilingYen
  · simp [withinFineCeiling, h]
  · simp [withinFineCeiling, h]

/-- Boundary: exactly 一年 = 1 年 is within the imprisonment ceiling. -/
theorem imprisonment_at_ceiling : withinImprisonmentCeiling 1 = true := by
  rw [withinImprisonmentCeiling_iff]
  unfold imprisonmentCeilingYears
  omega

/-- Boundary: 2 年 exceeds the imprisonment ceiling. -/
theorem imprisonment_over_ceiling : withinImprisonmentCeiling 2 = false := by
  decide

/-- Boundary: exactly 五十万円 = 500,000 円 is within the fine ceiling. -/
theorem fine_at_ceiling : withinFineCeiling 500_000 = true := by
  rw [withinFineCeiling_iff]
  unfold fineCeilingYen
  omega

/-- Boundary: 500,001 円 exceeds the fine ceiling. -/
theorem fine_over_ceiling : withinFineCeiling 500_001 = false := by
  decide

/-- Zero is within both ceilings (each on its own axis). -/
theorem zero_within_both :
    withinImprisonmentCeiling 0 = true ∧ withinFineCeiling 0 = true := by
  constructor
  · rw [withinImprisonmentCeiling_iff]
    unfold imprisonmentCeilingYears
    omega
  · rw [withinFineCeiling_iff]
    unfold fineCeilingYen
    omega

/-- Monotonicity (year axis): a shorter term still satisfies the ceiling. -/
theorem imprisonment_monotone {a b : Nat}
    (h : withinImprisonmentCeiling a = true) (hle : b <= a) :
    withinImprisonmentCeiling b = true := by
  rw [withinImprisonmentCeiling_iff] at h ⊢
  omega

/-- Monotonicity (yen axis): a smaller fine still satisfies the ceiling. -/
theorem fine_monotone {a b : Nat}
    (h : withinFineCeiling a = true) (hle : b <= a) :
    withinFineCeiling b = true := by
  rw [withinFineCeiling_iff] at h ⊢
  omega

end JapanTaxLaw.SCFVPenaltyCeiling
