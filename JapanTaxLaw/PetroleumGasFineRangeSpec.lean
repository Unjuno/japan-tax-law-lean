import JapanTaxLaw.PetroleumGasFineRange

/-
# PetroleumGasFineRange spec — 石油ガス税法 art.27 の独立整数定式

Pinned source: law 340AC0000000156, revision 340AC0000000156_20260525_506AC0000000052,
raw data/raw/340AC0000000156_20260525_506AC0000000052.law.json (sha256
537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153), Article Num 27.

This module is an INDEPENDENT restatement. It carries its OWN statutory
constants (`specFloor`, `specMult`) and expresses the two conditions with
different surface operators: `specApplies` uses `>` rather than `<`, and
`specWithin` uses a strict `<` with `+ 1` rather than the inclusive `<=`.
It reuses NO implementation definition in those formulas: the two universal
`agree*` theorems below are the only bridge, and `omega` checks them for
every Nat input, not just a finite sample.

「超え」は strict (<)、「以下」は inclusive (<=)。spec はこれを `>` と
strict `<` + `+1` という異なる演算子で定式化する。
-/

namespace JapanTaxLaw.PetroleumGasFineRange

/-- 五十万円: spec-local 下限 = 500,000. Independent of impl `fineFloor`. -/
def specFloor : Nat := 500_000

/-- 三倍: spec-local 倍率 = 3. Independent of impl constants. -/
def specMult : Nat := 3

/-- 「三倍が五十万円を超える場合」— formulation uses `>` (impl uses `<`). -/
def specApplies (tax : Nat) : Bool :=
  decide (specMult * tax > specFloor)

/-- 「五十万円を超え三倍以下」— strict `<` with `+ 1` instead of `<=`. -/
def specWithin (fine tax : Nat) : Bool :=
  decide (specFloor < fine && fine < specMult * tax + 1)

/-- Universal kernel-checked agreement for the range-application condition. -/
theorem agree_range (tax : Nat) :
    rangeApplies tax = specApplies tax := by
  unfold rangeApplies fineUpper fineFloor specApplies specMult specFloor
  by_cases h : 500_000 < 3 * tax
  · have hs : 3 * tax > 500_000 := by omega
    simp [h, hs]
  · have hs : ¬ (3 * tax > 500_000) := by omega
    simp [h, hs]

/-- Universal kernel-checked agreement for the fine-range predicate. -/
theorem agree_within (fine tax : Nat) :
    fineWithinRange fine tax = specWithin fine tax := by
  unfold fineWithinRange fineUpper fineFloor specWithin specMult specFloor
  by_cases hlo : 500_000 < fine
  · by_cases hhi : fine <= 3 * tax
    · have hs : fine < 3 * tax + 1 := by omega
      simp [hlo, hhi, hs]
    · have hs : ¬ fine < 3 * tax + 1 := by omega
      simp [hlo, hhi, hs]
  · simp [hlo]

example : specFloor = 500_000 := by decide
example : specMult = 3 := by decide
example : specApplies 166_667 = true := by decide
example : specWithin 500_000 166_667 = false := by decide
example : specWithin 500_001 166_667 = true := by decide

end JapanTaxLaw.PetroleumGasFineRange
