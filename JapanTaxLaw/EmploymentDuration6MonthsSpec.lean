import JapanTaxLaw.EmploymentDuration6Months

/-
# EmploymentDuration6MonthsSpec — independent spec for 酒税の保全及び酒類業組合等に関する法律施行規則 第十一条の八

Pinned source:
  Law id: 328M50000040011
  Official title: 酒税の保全及び酒類業組合等に関する法律施行規則
    (abbrev 酒団法施行規則 / 酒類業組合法施行規則; the task label
    「酒税法施行規則」 is corrected as BY-DESIGN / CONFIRMED in the review)
  Law number: 昭和二十八年大蔵省令第十一号
  Law type: MinisterialOrdinance (省令)
  Revision: 328M50000040011_20260901_506M60000040032 (CurrentEnforced)
  Raw snapshot: data/raw/328M50000040011_20260901_506M60000040032.law.json
  sha256: d93f1c0211998c35e8acbc78620fe736df6b53d3b289ac1ee903a9b8b4543e3b
  Article: 第十一条の八 (raw JSON Article attr.Num = "11_8"), 第三号.
  原文逐語: 「酒類小売業者に引き続き六月以上の期間継続して雇用されることが予定されている者」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFloor : Nat := 6` (六月) and expresses 「六月以上」 as
`decide (¬ months < specFloor)` — a STRICT `<` with negation, deliberately a
DIFFERENT operator from the implementation's non-strict `>=`.

The ONLY bridge is the universal, axiom-free theorem `agreeDuration`, proved by
a pure `simp [Nat.not_lt]` rewrite: the constructive theorem `Nat.not_lt` turns
`¬ months < 6` into `6 <= months`, which is the same kernel term as
`months >= 6`. No `by_cases`, no `omega`, no `Classical.choice` in the bridge.
No implementation identifier (`durationFloor`, `meetsDurationFloor`) appears in
any independent `spec*` formula; the agreement theorem is not an independent
formula.

Variable contract: months = 継続雇用期間 (Nat, unit 月); 六月以上 = >=6 INCLUSIVE.
Not modelled (same as the implementation): the other selection items, ただし書,
法第八十六条の九, and other articles.
-/

namespace JapanTaxLaw.EmploymentDuration6Months

/-- Spec-local floor: 六月 = 6 (月, Nat). Independent of the impl. -/
def specFloor : Nat := 6

/-- Independent 「六月以上」: NOT (months < specFloor). Strict `<` + negation. -/
def specMeets (months : Nat) : Bool :=
  decide (¬ months < specFloor)

/-- Universal, kernel-checked correspondence for every Nat month count.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites `¬ months < 6` to
    `6 <= months`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeDuration (months : Nat) :
    meetsDurationFloor months = specMeets months := by
  unfold meetsDurationFloor specMeets durationFloor specFloor
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specMeets 0 = false := by decide
example : specMeets 5 = false := by decide
example : specMeets 6 = true := by decide
example : specMeets 7 = true := by decide

end JapanTaxLaw.EmploymentDuration6Months
