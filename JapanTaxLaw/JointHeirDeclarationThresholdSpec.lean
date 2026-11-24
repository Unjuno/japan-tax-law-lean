import JapanTaxLaw.JointHeirDeclarationThreshold

/-
# JointHeirDeclarationThresholdSpec — independent spec for 石油石炭税法施行令 art.13(3)（二人以上）

Pinned source:
  Law id: 353CO0000000132
  Revision: 353CO0000000132_20250401_507CO0000000006
  Snapshot: data/raw/353CO0000000132_20250401_507CO0000000006.law.json
  Statutory article: 第十三条(3) — 相続人が二人以上
  原文逐語: 「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」
  Normative unit: NORM|27ba36ac793253dc18c7e0d51b413a5554ceb6c5287167eb62ade42a81a59f3a

The implementation states 以上 with the inclusive operator `floor <= heirs`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ heirs < specHeirFloor)` — a different operator from `<=`. It reuses
NO implementation definition inside its own `spec*` defs; the universal
`agree_heir_floor` theorem is the only bridge, and the kernel checks it for
every Nat heir count.

Not modelled: the declaration content, 連署 procedure, preceding paragraph,
other paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.JointHeirDeclarationThreshold

/-- Spec-local statutory value: 二人 = 2 heirs. Independent of impl. -/
def specHeirFloor : Nat := 2

/-- Independent formula: 以上 as `¬ heirs < floor`. Uses `<`, not `<=`. -/
def specNeedsJoint (heirs : Nat) : Bool :=
  decide (¬ heirs < specHeirFloor)

/-- Universal, kernel-checked correspondence for every natural heir count. -/
theorem agree_heir_floor (heirs : Nat) :
    needsJointDeclaration heirs = specNeedsJoint heirs := by
  unfold needsJointDeclaration heirFloor specNeedsJoint specHeirFloor
  by_cases h : 2 <= heirs
  · have hn : ¬ heirs < 2 := by omega
    simp [h, hn]
  · have hn : heirs < 2 := by omega
    simp [h, hn]

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specHeirFloor = 2 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specHeirGrid : Bool :=
  let f := specHeirFloor
  [0, 1, f - 1, f, f + 1].all fun heirs =>
    specNeedsJoint heirs == decide (f <= heirs)

example : specHeirGrid = true := by decide

end JapanTaxLaw.JointHeirDeclarationThreshold
