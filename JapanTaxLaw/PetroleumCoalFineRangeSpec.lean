import JapanTaxLaw.PetroleumCoalFineRange

/-!
# PetroleumCoalFineRange spec — 石油石炭税法 art.23(4) の独立整数定式

Pinned source: law 353AC0000000025, revision 353AC0000000025_20260525_506AC0000000052,
raw data/raw/353AC0000000025_20260525_506AC0000000052.law.json (sha256
b72f9fc1fde5b54cdb4862074330e7f2be99858780717f589e4932d1d115b625), Article Num 23 para 4.

This module is an INDEPENDENT restatement. It carries its OWN statutory
constants (`specFineFloor`, `specMultiplier`) and expresses the two conditions
with different surface operators: `specRangeApplies` uses `>` rather than `<`,
and `specFineWithin` uses a strict `<` with `+ 1` rather than the inclusive
`<=`. It reuses NO implementation definition in those formulas: the two
universal `agree*` theorems below are the only bridge, and `omega` checks them
for every Nat input, not just a finite sample.
-/

namespace JapanTaxLaw.PetroleumCoalFineRange

/-- 五十万円: spec-local 下限 = 500,000. Independent of impl `fineFloor`. -/
def specFineFloor : Nat := 500_000

/-- 三倍: spec-local 倍率 = 3. Independent of impl constants. -/
def specMultiplier : Nat := 3

/-- 「三倍が五十万円を超える場合」— formulation uses `>` (impl uses `<`). -/
def specRangeApplies (tax : Nat) : Bool :=
  decide (specMultiplier * tax > specFineFloor)

/-- 「五十万円を超え三倍以下」— strict `<` with `+ 1` instead of `<=`. -/
def specFineWithin (fine tax : Nat) : Bool :=
  decide (specFineFloor < fine && fine < specMultiplier * tax + 1)

/-- Universal kernel-checked agreement for the range-application condition. -/
theorem agree_range (tax : Nat) :
    rangeApplies tax = specRangeApplies tax := by
  unfold rangeApplies fineUpper fineFloor specRangeApplies specMultiplier specFineFloor
  by_cases h : 500_000 < 3 * tax
  · have hs : 3 * tax > 500_000 := by omega
    simp [h, hs]
  · have hs : ¬ (3 * tax > 500_000) := by omega
    simp [h, hs]

/-- Universal kernel-checked agreement for the fine-range predicate. -/
theorem agree_within (fine tax : Nat) :
    fineWithinRange fine tax = specFineWithin fine tax := by
  unfold fineWithinRange fineUpper fineFloor specFineWithin specMultiplier specFineFloor
  by_cases hlo : 500_000 < fine
  · by_cases hhi : fine ≤ 3 * tax
    · have hs : fine < 3 * tax + 1 := by omega
      simp [hlo, hhi, hs]
    · have hs : ¬ fine < 3 * tax + 1 := by omega
      simp [hlo, hhi, hs]
  · simp [hlo]

example : specFineFloor = 500_000 := by decide
example : specMultiplier = 3 := by decide
example : specRangeApplies 166_667 = true := by decide
example : specFineWithin 500_000 166_667 = false := by decide
example : specFineWithin 500_001 166_667 = true := by decide

end JapanTaxLaw.PetroleumCoalFineRange
