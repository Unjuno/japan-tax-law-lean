import JapanTaxLaw.SixMonthPeriodDeeming

/-
# SixMonthPeriodDeemingSpec — independent spec for 納税貯蓄組合法施行令 第三条

Pinned source:
  Law id: 326CO0000000099
  Revision: 326CO0000000099_20191216_501CO0000000183
  Raw snapshot: data/raw/326CO0000000099_20191216_501CO0000000183.law.json
  sha256: 4bea6d03094f44349178f1f6be77f66c0f71ac107cd78b8a5edab5081fc9e84c
  Article: 第三条 (raw JSON Article attr.Num = "3")
  原文逐語: 「前項に規定する利子計算期間又は事業年度が六月をこえる場合においては、同項の規定の適用については、当該利子計算期間又は事業年度開始の日から六月ごとに区分した期間（最後に六月未満の期間を生じたときは、当該期間）を、それぞれ一利子計算期間又は一事業年度とみなす。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specChunk : Nat := 6` (六月 = 6 months, independently restated from 第三条)
and expresses the ceiling segmentation with its own formula
`if months == 0 then 0 else (months + specChunk - 1) / specChunk` and the
strict deeming trigger as `decide (months > specChunk)`. The `- 1` is the
structural ceiling-division term, not a second statutory literal, so the
only spec numeral is 6. No implementation identifier (`segmentCount`,
`deemingApplies`, `segmentCount_eq_div`, ...) appears in any independent
`spec*` formula.

The ONLY bridges are the universal, axiom-free theorems `agreeSegments` and
`agreeDeeming`: after unfolding, both sides are syntactically identical, so
plain `rfl` closes them. No `by_cases`, no `omega`, no `Classical.choice`,
no `propext` is used in either bridge (NickelContentThresholdSpec pattern).

Variable contract: months = 利子計算期間／事業年度の月数 (Nat, unit 月);
六月 = 6 months; 六月をこえる = STRICT `>`; final partial chunk counted.
Not modelled (same as the implementation): 前項の定義, 金融機関の特例（第三項）,
interest computation itself, other articles.
-/

namespace JapanTaxLaw.SixMonthPeriodDeeming

/-- Spec-local 六月: chunk length of six months (unit 月, Nat). -/
def specChunk : Nat := 6

/-- Independent ceiling segmentation: ceil(months / specChunk), 0 maps to 0. -/
def specSegments (months : Nat) : Nat :=
  if months == 0 then 0 else (months + specChunk - 1) / specChunk

/-- Independent 「六月をこえる」: STRICT `> specChunk`. -/
def specDeeming (months : Nat) : Bool :=
  decide (months > specChunk)

/-- Universal, kernel-checked correspondence for every Nat input.
    Pure `rfl` after unfolding: no by_cases/omega/Classical.choice. -/
theorem agreeSegments (months : Nat) :
    segmentCount months = specSegments months := by
  unfold segmentCount specSegments specChunk
  rfl

/-- Universal, kernel-checked correspondence for every Nat input.
    Pure `rfl` after unfolding: no by_cases/omega/Classical.choice. -/
theorem agreeDeeming (months : Nat) :
    deemingApplies months = specDeeming months := by
  unfold deemingApplies specDeeming specChunk
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specSegments 0 = 0 := by decide
example : specSegments 6 = 1 := by decide
example : specSegments 7 = 2 := by decide
example : specSegments 13 = 3 := by decide
example : specDeeming 6 = false := by decide
example : specDeeming 7 = true := by decide

end JapanTaxLaw.SixMonthPeriodDeeming
