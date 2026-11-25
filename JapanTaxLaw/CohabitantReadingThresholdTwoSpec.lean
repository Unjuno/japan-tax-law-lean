import JapanTaxLaw.CohabitantReadingThresholdTwo

/-
# CohabitantReadingThresholdTwoSpec — independent spec for 能登半島地震臨時特例法等施行令 art.2(2)（二人以上）

Pinned source:
  Law id: 506CO0000000033
  Revision: 506CO0000000033_20240221_000000000000000
  Statutory article: 第二条(2)
  原文逐語: 「所得税法施行令第二百五条第二項の規定は、前項に規定する親族と生計を一にする居住者が二人以上ある場合について準用する。」
  Normative unit: NORM|e713fefceeb078384dd5e386ecdeab7c8fa82cb5b85adb34fb8e9028deb1bdbe

This module carries its OWN statutory constant. 以上 is expressed as the
negation of the strict opposite order, `decide (¬ residents < floor)` — a
different operator from the impl's `<=`. It reuses NO implementation
definition in its `spec*` defs; the universal `agree_cohabitant_floor` theorem
is the only bridge, and the kernel checks it for every Nat count by structural
recursion (axiom-free).

Not modelled: the cross-law provision being read in, the definition of
cohabiting relatives, other paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.CohabitantReadingThresholdTwo

/-- Spec-local statutory value: 二人 = 2. Independent of impl. -/
def specCohabitantFloor : Nat := 2

/-- Independent formula: 以上 as `¬ residents < floor`. Uses `<`, not `<=`. -/
def specAppliesReading (residents : Nat) : Bool :=
  decide (¬ residents < specCohabitantFloor)

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specCohabitantFloor = 2 := rfl

/-- Universal, kernel-checked, axiom-free agreement for every Nat count. -/
theorem agree_cohabitant_floor : ∀ residents : Nat,
    appliesReading residents = specAppliesReading residents
  | 0 => by decide
  | 1 => by decide
  | 2 => by decide
  | Nat.succ (Nat.succ (Nat.succ (k))) => by
      unfold appliesReading cohabitantFloor specAppliesReading specCohabitantFloor
      rfl

/-- Finite spec-local grid (Bool scaffolding); universal theorem is the proof. -/
def specCohabitantGrid : Bool :=
  [0, 1, 2, 3].all fun residents =>
    specAppliesReading residents == decide (2 <= residents)

example : specCohabitantGrid = true := by decide

end JapanTaxLaw.CohabitantReadingThresholdTwo
