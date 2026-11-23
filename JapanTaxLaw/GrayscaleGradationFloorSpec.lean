import JapanTaxLaw.GrayscaleGradationFloor

/-
# GrayscaleGradationFloorSpec — independent spec for 情報通信技術活用省令 art.5(2)(2)（二百五十六階調以上）

Pinned source:
  Law id: 415M60000040071
  Revision: 415M60000040071_20260924_506M60000040031
  Snapshot: data/raw/415M60000040071_20260924_506M60000040031.law.json
  Statutory article: 第五条(2)(2) — 二百五十六階調以上
  原文逐語: 「白色から黒色までの階調が二百五十六階調以上であること。」
  Normative unit: NORM|d74340473e54a94163ee5d61d028c0fa4379a44d178ca21a314441520806eaf6

The implementation states 以上 with the inclusive operator `floor <= levels`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ levels < specFloor)` — a different operator from `<=`. It reuses NO
implementation definition inside its own `spec*` defs; the universal
`agree_grayscale_floor` theorem is the only bridge, and the kernel checks it for
every Nat level count.

Not modelled: the gated imaging/record-keeping requirements, 白色/黒色
definitions, other items/paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.GrayscaleGradationFloor

/-- Spec-local statutory value: 二百五十六 = 256 levels. Independent of impl. -/
def specFloor : Nat := 256

/-- Independent formula: 以上 as `¬ levels < floor`. Uses `<`, not `<=`. -/
def specMeetsGrayscale (levels : Nat) : Bool :=
  decide (¬ levels < specFloor)

/-- Universal, kernel-checked correspondence for every natural level count. -/
theorem agree_grayscale_floor (levels : Nat) :
    meetsGrayscaleFloor levels = specMeetsGrayscale levels := by
  unfold meetsGrayscaleFloor gradationFloor specMeetsGrayscale specFloor
  by_cases h : 256 <= levels
  · have hn : ¬ levels < 256 := by omega
    simp [h, hn]
  · have hn : levels < 256 := by omega
    simp [h, hn]

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specFloor = 256 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specGrayscaleGrid : Bool :=
  let f := specFloor
  [0, 1, f - 1, f, f + 1].all fun levels =>
    specMeetsGrayscale levels == decide (f <= levels)

example : specGrayscaleGrid = true := by decide

end JapanTaxLaw.GrayscaleGradationFloor
