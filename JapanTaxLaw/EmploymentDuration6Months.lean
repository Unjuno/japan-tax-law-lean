import JapanTaxLaw.TaxFinance

/-
# EmploymentDuration6Months — 酒税の保全及び酒類業組合等に関する法律施行規則 第十一条の八（継続雇用期間 六月以上）

Pinned source:
  Law id: 328M50000040011
  Official title: 酒税の保全及び酒類業組合等に関する法律施行規則
    (abbrev 酒団法施行規則 / 酒類業組合法施行規則). The short label
    「酒税法施行規則」 is NOT the official title; it is corrected here and in
    docs/adversarial/reviews-batch-55.md as BY-DESIGN / CONFIRMED.
  Law number: 昭和二十八年大蔵省令第十一号
  Law type: MinisterialOrdinance (省令)
  Revision: 328M50000040011_20260901_506M60000040032
    (current_revision_status = CurrentEnforced; verified against the source file
    that actually exists, and against data/INVENTORY.json,
    data/reference_stats.json and data/raw/328M50000040011.revisions.json)
  Raw snapshot: data/raw/328M50000040011_20260901_506M60000040032.law.json
  sha256: d93f1c0211998c35e8acbc78620fe736df6b53d3b289ac1ee903a9b8b4543e3b
    (recomputed from the raw bytes; equals the uppercase pin
     D93F1C0211998C35E8ACBC78620FE736DF6B53D3B289AC1EE903A9B8B4543E3B)
  Statutory article: 第十一条の八 (art. 11_8; raw JSON Article attr.Num = "11_8",
    caption （酒類販売管理者の選任）).
  Source path: law_full_text → Article[Num=11_8] → 第三号 (item 3).
  Independent re-extraction: exactly 1 structural Article hit for Num="11_8";
  the needle occurs verbatim once in the scoped article and once in full text.

原文逐語（pinned, 一字一句改変なし）:
  「酒類小売業者に引き続き六月以上の期間継続して雇用されることが予定されている者」

Variable contract:
  `months : Nat` = 継続雇用期間 (planned continuous employment period),
  unit 月 (whole months). 六月 = 6 months. 以上 is INCLUSIVE: `months >= 6`.
  `durationFloor : Nat := 6`; `meetsDurationFloor months := decide (months >= durationFloor)`.

Scope: ONLY the explicit numeric duration condition is modelled — 六月以上 is a
minimum of 6 whole months, inclusive at exactly 6. The surrounding selection
requirements (選任の方法, 欠けたときの選任, 生計を一にする親族, 他販売場, 研修要件,
ただし書), 法第八十六条の九, and all other items/articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.EmploymentDuration6Months

/-- 六月 = 6 月. Unit 月; domain Nat. -/
def durationFloor : Nat := 6

/-- 「六月以上の期間」: the planned continuous employment period is at least
    6 whole months (以上 = inclusive `>=`, so exactly 6 qualifies). -/
def meetsDurationFloor (months : Nat) : Bool :=
  decide (months >= durationFloor)

/-- The statutory floor really is 六月 = 6. -/
theorem durationFloor_value : durationFloor = 6 := rfl

/-- Zero months is below the 六月 floor. -/
theorem zero_false : meetsDurationFloor 0 = false := by
  unfold meetsDurationFloor durationFloor
  decide

/-- Five months is still below the 六月 floor. -/
theorem five_false : meetsDurationFloor 5 = false := by
  unfold meetsDurationFloor durationFloor
  decide

/-- Exactly 六月 = 6 months qualifies: 以上 is inclusive. -/
theorem six_true : meetsDurationFloor 6 = true := by
  unfold meetsDurationFloor durationFloor
  decide

/-- Seven months qualifies. -/
theorem seven_true : meetsDurationFloor 7 = true := by
  unfold meetsDurationFloor durationFloor
  decide

/-- Direct-inequality monotonicity (plain Nat inequality, no typeclass helper): a period that meets the
    floor stays above it when extended, i.e. `months >= 6` and `months <= months'`
    imply `months' >= 6`. -/
theorem meetsDurationFloor_of_ge {months months' : Nat}
    (h : meetsDurationFloor months = true) (hle : months <= months') :
    meetsDurationFloor months' = true := by
  unfold meetsDurationFloor durationFloor at h ⊢
  apply decide_eq_true
  have hm : months >= 6 := of_decide_eq_true h
  omega

end JapanTaxLaw.EmploymentDuration6Months
