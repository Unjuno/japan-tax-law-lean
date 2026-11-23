import JapanTaxLaw.Gradation256Floor

/-
# Gradation256FloorSpec — independent spec for 電子帳簿保存法施行規則 art.2(6)(2)（二百五十六階調以上）

Pinned source:
  Law id: 410M50000040043
  Revision: 410M50000040043_20250401_507M60000040028
  Snapshot: data/raw/410M50000040043_20250401_507M60000040028.law.json
  Statutory article: 第二条(6)(2)イ(二) — 二百五十六階調以上
  原文逐語: 「赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上で読み取るものであること。」
  Normative unit: NORM|f99be74c91690ed7e64d9df9919b260bb873b5750e0dc4574e67886b2e23416c

The implementation states 以上 with the inclusive operator `floor <= levels`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ levels < specGradationFloor)` — a different operator from `<=`. It
reuses NO implementation definition inside its own `spec*` defs; the universal
`agree_gradation_floor` theorem is the only bridge, and the kernel checks it for
every Nat level count.

Not modelled: the three-channel conjunction, the gated record-keeping rules,
other items/subitems and enforcement rules.
-/

namespace JapanTaxLaw.Gradation256Floor

/-- Spec-local statutory value: 二百五十六 = 256 levels. Independent of impl. -/
def specGradationFloor : Nat := 256

/-- Independent formula: 以上 as `¬ levels < floor`. Uses `<`, not `<=`. -/
def specMeetsGradation (levels : Nat) : Bool :=
  decide (¬ levels < specGradationFloor)

/-- Universal, kernel-checked correspondence for every natural level count. -/
theorem agree_gradation_floor (levels : Nat) :
    meetsGradationFloor levels = specMeetsGradation levels := by
  unfold meetsGradationFloor gradationFloor specMeetsGradation specGradationFloor
  by_cases h : 256 <= levels
  · have hn : ¬ levels < 256 := by omega
    simp [h, hn]
  · have hn : levels < 256 := by omega
    simp [h, hn]

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specGradationFloor = 256 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specGradationGrid : Bool :=
  let f := specGradationFloor
  [0, 1, f - 1, f, f + 1].all fun levels =>
    specMeetsGradation levels == decide (f <= levels)

example : specGradationGrid = true := by decide

end JapanTaxLaw.Gradation256Floor
